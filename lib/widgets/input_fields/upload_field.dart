import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moscow/domain/models/sending_attachment.dart';
import 'package:moscow/widgets/shimmers/container.dart';
import 'package:shimmer/shimmer.dart';

import '../gradient_border.dart';
import '../image_loader.dart';

class UploadField extends StatefulWidget {
  UploadField(
      {Key? key, this.value, required this.title, required this.onChanged})
      : super(key: key);

  final SendingAttachment? value;
  final String title;
  final ValueChanged<SendingAttachment> onChanged;

  @override
  _UploadFieldState createState() => _UploadFieldState();
}

class _UploadFieldState extends State<UploadField>
    with AutomaticKeepAliveClientMixin {
  File? _image;
  bool _loading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var child;
    if (widget.value != null) {
      return GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.memory(widget.value!.file.readAsBytesSync()),
                    Positioned(
                      height: 30,
                      width: 30,
                      top: 16,
                      right: 16,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 1,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        fillColor: Colors.grey.withOpacity(1),
                        child: Center(
                          child:
                              Icon(Icons.close, size: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))),
      );
    }
    if (_loading) {
      child = GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: ContainerShimmer(),
          onPressed: () async {
            setState(() {
              _loading = true;
            });
            final data = await ImageLoader.of(context)!.uploadImage();

            precacheImage(MemoryImage(data.file!.readAsBytesSync()), context);
            setState(() {
              _loading = false;
              _image = data.file;
            });
          });
    } else if (_image == null) {
      child = GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 16)),
                Text('нажмите, чтобы выбрать изображение')
              ],
            ),
          ),
          onPressed: () async {
            setState(() {
              _loading = true;
            });
            final data = await ImageLoader.of(context)!.uploadImage();
            widget.onChanged(SendingAttachment(
                file: data.file!, url: data.url, uploaded: true));
            setState(() {
              _loading = false;
              _image = data.file;
            });
          });
    } else {
      child = GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.memory(_image!.readAsBytesSync()),
                    Positioned(
                      height: 30,
                      width: 30,
                      top: 16,
                      right: 16,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 1,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        fillColor: Colors.grey.withOpacity(1),
                        child: Center(
                          child:
                              Icon(Icons.close, size: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))),
      );
    }

    return child;
  }
}
