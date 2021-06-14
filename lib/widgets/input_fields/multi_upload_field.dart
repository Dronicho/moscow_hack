import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moscow/domain/models/sending_attachment.dart';

import '../gradient_border.dart';
import '../image_loader.dart';

class MultiUploadField extends StatefulWidget {
  const MultiUploadField(
      {Key? key, required this.title, required this.onChanged, this.value})
      : super(key: key);

  final List<SendingAttachment>? value;
  final String title;
  final ValueChanged<List<SendingAttachment>> onChanged;

  @override
  _MultiUploadFieldState createState() => _MultiUploadFieldState();
}

class _MultiUploadFieldState extends State<MultiUploadField> {
  List<SendingAttachment> _files = [];

  bool get loaded => _files.every((element) => element.uploaded);

  void _loadFiles() {
    ImageLoader.of(context)!.uploadFiles((url, file) {
      print(url);
      print(file);
      if (url == null) {
        setState(() {
          _files.add(SendingAttachment(file: File(file.path!)));
        });
      }
      if (url != null) {
        setState(() {
          _files = _files.map((e) {
            if (e.file.path == file.path!) {
              return SendingAttachment(
                  file: File(e.file.path), url: url, uploaded: true);
            }
            return e;
          }).toList();
        });
        if (_files.every((element) => element.uploaded)) {
          widget.onChanged(_files);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var child;

    if (widget.value != null && widget.value!.isNotEmpty) {
      return GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: widget.value!
                  .map((e) => Chip(
                        deleteIcon: Icon(Icons.close),
                        onDeleted: () {
                          setState(() {
                            _files = _files
                                .where((f) => f.file.path != e.file.path)
                                .toList();
                            widget.onChanged(_files);
                          });
                        },
                        label: Text(e.file.path.split('/').last),
                      ))
                  .toList(),
            ),
          ),
        ),
      );
    }
    if (_files.isEmpty) {
      child = GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 16)),
                Text('нажмите, чтобы выбрать файлы')
              ],
            ),
          ),
          onPressed: _loadFiles);
    } else if (!loaded) {
      child = GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 45,
              child: LinearProgressIndicator(
                value: _files.fold<int>(
                        0,
                        (previousValue, element) =>
                            previousValue + (element.uploaded ? 1 : 0)) /
                    _files.length,
              ),
            )),
      );
    } else {
      child = GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: _files
                  .map((e) => Chip(
                        deleteIcon: Icon(Icons.close),
                        onDeleted: () {
                          setState(() {
                            _files = _files
                                .where((f) => f.file.path != e.file.path)
                                .toList();
                            widget.onChanged(_files);
                          });
                        },
                        label: Text(e.file.path.split('/').last),
                      ))
                  .toList(),
            ),
          ),
        ),
      );
    }

    return child;
  }
}
