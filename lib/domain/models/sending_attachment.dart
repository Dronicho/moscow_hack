import 'dart:io';

class SendingAttachment {
  File file;
  bool uploaded;
  String url;

  SendingAttachment({required this.file, this.uploaded = false, this.url = ''});
}