import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moscow/domain/models/attachment.dart';
import 'package:moscow/domain/models/message.dart';
import 'package:moscow/domain/models/room.dart';
import 'package:moscow/domain/models/user.dart';

typedef FileUploader = Future<String> Function(File, Room);
typedef AttachmentThumbnailBuilder = Widget Function(
  BuildContext,
  _SendingAttachment,
);

enum ActionsLocation {
  left,
  right,
}

enum DefaultAttachmentTypes {
  image,
  video,
  file,
}

class MessageInput extends StatefulWidget {
  MessageInput({Key? key}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput>
    with TickerProviderStateMixin {
  final List<_SendingAttachment> _attachments = [];
  final _focusNode = FocusNode();

  final _imagePicker = ImagePicker();
  bool _inputEnabled = true;
  bool _messageIsPresent = false;
  bool _typingStarted = false;
  OverlayEntry? _commandsOverlay;

  late TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy > 0) {}
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAttachments(),
                  if (_attachments.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  _buildTextField(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachments() {
    return Wrap(
      direction: Axis.horizontal,
      children: _attachments
          .map((attachment) => ScaleTransition(
                scale: attachment.animation,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 100,
                              child: _buildAttachment(attachment),
                            ),
                            attachment.uploaded
                                ? SizedBox()
                                : Positioned.fill(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      _buildRemoveButton(attachment),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Flex _buildTextField(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildAttachmentButton(),
        _buildTextInput(context),
        _animateSendButton(context)
      ],
    );
  }

  AnimatedCrossFade _animateSendButton(BuildContext context) {
    return AnimatedCrossFade(
        crossFadeState: ((_messageIsPresent || _attachments.isNotEmpty) &&
                _attachments.every((a) => a.uploaded == true))
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: _buildSendButton(context),
        secondChild: SizedBox(),
        reverseDuration: Duration(milliseconds: 100),
        duration: Duration(milliseconds: 100),
        alignment: Alignment.bottomCenter);
  }

  Expanded _buildTextInput(BuildContext context) {
    return Expanded(
      child: LimitedBox(
        maxHeight: 150,
        child: TextField(
          key: Key('textInput'),
          enabled: _inputEnabled,
          minLines: null,
          maxLines: null,
          onSubmitted: (_) {},
          controller: textEditingController,
          onChanged: (s) {
            setState(() {
              _messageIsPresent = s.trim().isNotEmpty;
            });

            _commandsOverlay?.remove();
            _commandsOverlay = null;
            // TODO: start typing;
          },
          onTap: () {
            setState(() {
              _typingStarted = true;
            });
          },
          style: Theme.of(context).textTheme.bodyText2,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Введите сообщение',
              prefixText: '   ',
              border: InputBorder.none),
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: IconButton(
        key: Key('sendButton'),
        onPressed: () {
          sendMessage();
        },
        icon: Icon(
          Icons.send,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Positioned _buildRemoveButton(_SendingAttachment attachment) {
    return Positioned(
      height: 20,
      width: 20,
      top: -6,
      right: -6,
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
          attachment.controller.reverse().then((value) {
            attachment.controller.dispose();
            setState(() {
              _attachments.remove(attachment);
            });
          });
        },
        fillColor: Colors.grey.withOpacity(1),
        child: Center(
          child: Icon(Icons.close, size: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAttachment(_SendingAttachment attachment) {
    switch (attachment.attachment.type) {
      case 'image':
      case 'giphy':
        return GestureDetector(
            onTap: () {},
            child: Hero(
              tag: attachment.attachment.localUri!.path,
              child: Image.file(attachment.file, fit: BoxFit.cover),
            ));

      case 'video':
        return Container(
          child: Icon(Icons.videocam),
          color: Colors.black26,
        );
      default:
        return Container(
          child: Icon(Icons.insert_drive_file),
          color: Colors.black26,
        );
    }
  }

  Material _buildAttachmentButton() {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.transparent,
      child: IconButton(
        onPressed: () {
          showImageModal();
        },
        icon: Icon(
          Icons.attach_file,
          color: Colors.grey,
          size: 32,
        ),
      ),
    );
  }

  // TODO: rewrite this method to exclude local_image_provider depency

  void showImageModal() async {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    // bool hasPermission = await provider.initialize();
    // if (hasPermission) {
    //   List<LocalImage> images = await provider.findLatest(150);
    //   if (images.isNotEmpty) {
    //     showModalBottomSheet(
    //       context: context,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(12),
    //           topRight: Radius.circular(12),
    //         ),
    //       ),
    //       isScrollControlled: true,
    //       builder: (context) => Container(
    //         child: DraggableScrollableSheet(
    //           initialChildSize: 0.5,
    //           minChildSize: 0.3,
    //           maxChildSize: 1,
    //           builder: (context, controller) => GridView.builder(
    //             controller: controller,
    //             itemCount: images.length,
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 3),
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 height: 100,
    //                 width: 100,
    //                 child: Image(
    //                   image: DeviceImage(images[index]),
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // }
  }

  void showAttachmentModal() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }

    showModalBottomSheet(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          final primaryColor = Theme.of(context).primaryColor;
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Добавить вложение',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.image, color: primaryColor),
                  title: Text('Выбрать фото'),
                  onTap: () {
                    pickFile(DefaultAttachmentTypes.image, false);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.video_library, color: primaryColor),
                  title: Text('Выбрать видео'),
                  onTap: () {
                    pickFile(DefaultAttachmentTypes.video, false);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt, color: primaryColor),
                  title: Text('Сделать фото'),
                  onTap: () {
                    pickFile(DefaultAttachmentTypes.image, true);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.videocam, color: primaryColor),
                  title: Text('Снять видео'),
                  onTap: () {
                    pickFile(DefaultAttachmentTypes.video, true);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.insert_drive_file, color: primaryColor),
                  title: Text('Выбрать файл'),
                  onTap: () {
                    pickFile(DefaultAttachmentTypes.file, false);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void pickFile(DefaultAttachmentTypes fileType, [bool camera = false]) async {
    setState(() {
      _inputEnabled = false;
    });

    List<SelectedFile> files = [];
    late String attachmentType;

    // TODO: add attachment types mapper
    if (fileType == DefaultAttachmentTypes.image) {
      attachmentType = 'image';
    } else if (fileType == DefaultAttachmentTypes.video) {
      attachmentType = 'video';
    } else if (fileType == DefaultAttachmentTypes.file) {
      attachmentType = 'file';
    }

    if (camera) {
      PickedFile? pickedFile;
      if (fileType == DefaultAttachmentTypes.image) {
        pickedFile = await _imagePicker.getImage(source: ImageSource.camera);
      } else if (fileType == DefaultAttachmentTypes.video) {
        pickedFile = await _imagePicker.getVideo(source: ImageSource.camera);
      }
      if (pickedFile != null)
        files.add(SelectedFile(File(pickedFile.path), ""));
    } else {
      late FileType type;
      if (fileType == DefaultAttachmentTypes.image) {
        type = FileType.image;
      } else if (fileType == DefaultAttachmentTypes.video) {
        type = FileType.video;
      } else if (fileType == DefaultAttachmentTypes.file) {
        type = FileType.any;
      }
      final res =
          await FilePicker.platform.pickFiles(type: type, allowMultiple: true);
      if (res?.files.isNotEmpty == true) {
        files
            .addAll(res!.files.map((e) => SelectedFile(File(e.path!), e.name)));
      }
    }

    setState(() {
      _inputEnabled = true;
    });

    if (files.isEmpty) {
      return;
    }

    var attachments = files.map((f) {
      var controller = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 1000),
          reverseDuration: Duration(milliseconds: 300));
      var animation = CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutBack,
      );
      Future.delayed(Duration(milliseconds: 250), () => controller.forward());

      return _SendingAttachment(
        file: f.file,
        controller: controller,
        animation: animation,
        attachment: Attachment(
          imageUrl: '',
          localUri: f.file.uri,
          type: attachmentType,
        ),
      );
    }).toList();

    setState(() {
      _attachments.addAll(attachments);
    });

    for (var i = 0; i < files.length; i++) {
      var file = files[i].file;
      var attachment = attachments[i];
      final url = await _uploadAttachment(file, fileType);

      if (fileType == DefaultAttachmentTypes.image) {
        var image = FileImage(file);
        var completer = Completer();
        image.resolve(ImageConfiguration()).addListener(ImageStreamListener(
              (info, _) => completer.complete(info.image),
            ));

        var size = await completer.future;
        print(size);

        attachment.attachment = attachment.attachment.copyWith(
          height: size.height.toDouble(),
          width: size.width.toDouble(),
          imageUrl: url,
        );
      } else if (fileType == DefaultAttachmentTypes.image) {
        // final uint8list = await VideoThumbnail.thumbnailFile(
        //   video: file.path,
        //   imageFormat: ImageFormat.JPEG,
        //   maxWidth:
        //       256, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        //   quality: 75,
        // );

        // final thumbUrl = await _uploadAttachment(File(uint8list), fileType);
        // attachment.attachment =
        //     attachment.attachment.copyWith(assetUrl: url, thumbUrl: thumbUrl);
      } else if (fileType == DefaultAttachmentTypes.file) {
        attachment.attachment = attachment.attachment.copyWith(assetUrl: url);
      }

      setState(() {
        attachment.uploaded = true;
      });
    }
  }

  Future<String> _uploadAttachment(
      File file, DefaultAttachmentTypes fileType) async {
    return '';
    // return await _controller.uploadFile(file, fileType);
  }

  void sendMessage() async {
    final text = textEditingController.text.trim();
    if (text.isEmpty && _attachments.isEmpty) {
      return;
    }

    final attachments = List<_SendingAttachment>.from(_attachments);

    textEditingController.clear();
    _attachments.clear();

    setState(() {
      _messageIsPresent = false;
      _typingStarted = false;
    });

    Future sendingFuture;
    Message message;
    message = Message(
        user: User.empty,
        content: text,
        read: false,
        attachments: _getAttachments(attachments).toList(),
        createdAt: DateTime.now().toUtc());
    // sendingFuture = _controller.sendMessage(message);

    // return sendingFuture.then((resp) => null);
  }

  Iterable<Attachment> _getAttachments(List<_SendingAttachment> attachments) {
    return attachments.map((attachment) {
      return attachment.attachment;
    });
  }

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

class SelectedFile {
  final File file;
  final String name;

  SelectedFile(this.file, this.name);
}

class _SendingAttachment {
  File file;
  Attachment attachment;
  AnimationController controller;
  Animation<double> animation;
  bool uploaded;

  _SendingAttachment(
      {required this.file,
      required this.attachment,
      this.uploaded = false,
      required this.controller,
      required this.animation});
}
