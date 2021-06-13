import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:moscow/domain/models/attachment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class FileAttachment extends StatefulWidget {
  final Attachment attachment;
  final DateTime? createdAt;
  final Size? size;

  const FileAttachment({
    Key? key,
    required this.attachment,
    this.size,
    this.createdAt,
  }) : super(key: key);

  @override
  _FileAttachmentState createState() => _FileAttachmentState();
}

class _FileAttachmentState extends State<FileAttachment> {
  bool loading = false;
  bool downloaded = false;
  double progress = 0;
  var httpClient = HttpClient();
  String filename = Uuid().v4();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (!downloaded) {
          _startDownload();
        } else {
          openFile(context);
        }
      },
      child: Material(
        color: theme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 45,
                child: Material(
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            downloaded
                                ? Icons.insert_drive_file
                                : Icons.arrow_downward,
                            size: 20,
                          ),
                          if (loading)
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Container(
                                  padding: EdgeInsets.zero,
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 2,
                                  )),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text('12KB * DOCX',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.5))),
                          ],
                        ),
                        Row(
                          children: [
                            if (widget.createdAt != null)
                              Text(
                                  DateFormat.Hm('ru_RU')
                                      .format(widget.createdAt!),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.5))),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void openFile(BuildContext context) async {
    // var dir = (await getApplicationDocumentsDirectory()).path;
    // await launchURL(context, widget.attachment.assetUrl);
  }

  Future<File> _startDownload() async {
    setState(() {
      loading = true;
    });
    final request = Request('GET', Uri.parse(widget.attachment.assetUrl!));
    final response = await Client().send(request);
    final contentLength = response.contentLength;
    var dir = (await getApplicationDocumentsDirectory()).path;
    var file = File('$dir/$filename.txt');
    var bytes = <int>[];
    response.stream.listen(
      (List<int> newBytes) {
        setState(() {
          bytes.addAll(newBytes);
          final downloadedLength = bytes.length;
          progress = downloadedLength / contentLength!;
        });
      },
      onDone: () async {
        await file.writeAsBytes(bytes);
      },
      onError: (e) {
        print(e);
      },
      cancelOnError: true,
    );

    setState(() {
      loading = false;
      downloaded = true;
    });
    return file;
  }
}
