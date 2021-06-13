import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:intl/intl.dart';
import 'package:moscow/domain/models/attachment.dart';
import 'package:moscow/domain/models/message.dart';

import 'builders.dart';
import 'file_attachment.dart';
import 'utils.dart';

const defaultTheme = MessageTheme(
    content: TextStyle(),
    messageBackgroundColor: Color(0xFF137EFE),
    otherMessageBackgroundColor: Colors.white);

typedef AttachmentBuilder = Widget Function(BuildContext, Message, Attachment);
typedef MessageTapCallback = void Function(Message message);

class MessageWidget extends StatefulWidget {
  final bool reverse;
  final Message message;
  final MessageTapCallback onMessageTap;
  final BorderRadius borderRadius;
  final Map<String, AttachmentBuilder> attachmentBuilders;
  MessageWidget(
      {Key? key,
      required this.reverse,
      required this.message,
      borderRadius,
      required this.onMessageTap})
      : attachmentBuilders = {
          'image': (context, message, attachment) => ImageAttachment(
                attachment: attachment,
                message: message,
                size: Size(
                  MediaQuery.of(context).size.width * 0.6,
                  MediaQuery.of(context).size.height * 0.3,
                ),
              ),
          'file': (context, message, attachment) => FileAttachment(
              attachment: attachment, createdAt: message.createdAt),
        },
        borderRadius = BorderRadius.circular(6),
        super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    with TickerProviderStateMixin {
  bool menuOpen = false;
  double height = 0.0;
  late AnimationController _moveController;
  late Animation<Offset> _moveAnimation;
  late AnimationController _fadeInController;
  double _dragExtent = 0.0;
  // ignore: unused_field
  bool _dragUnderway = false;
  Size messageSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _fadeInController = AnimationController(
        duration: Duration(milliseconds: 200), vsync: this, value: 0.0);
    _moveController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..addStatusListener(_handleDismissStatusChanged);
    _updateMoveAnimation();
  }

  double get _overallDragAxisExtent => context.size!.width;

  @override
  void dispose() {
    _moveController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var transform = Matrix4.rotationY(widget.reverse ? pi : 0);

    return GestureDetector(
      onTap: () {
        widget.onMessageTap(widget.message);
      },
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: SlideTransition(
        position: _moveAnimation,
        child: Transform(
          alignment: Alignment.center,
          transform: transform,
          child: Stack(
            children: [
              Container(
                  height: height,
                  width: double.infinity,
                  color: Colors.transparent),
              widget.reverse
                  ? Positioned(
                      left: 5,
                      top: height / 2,
                      child: FadeTransition(
                        opacity: _fadeInController,
                        child: Icon(Icons.replay),
                      ))
                  : Positioned(
                      right: 5,
                      top: height / 2,
                      child: SlideTransition(
                        position: _moveAnimation,
                        child: FadeTransition(
                          opacity: _fadeInController,
                          child: Icon(Icons.replay),
                        ),
                      ),
                    ),
              MeasureSize(
                onChange: (size) {
                  setState(() {
                    height = size.height;
                  });
                },
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                Flexible(
                                  child: PortalEntry(
                                    visible: menuOpen,
                                    portalAnchor: widget.reverse
                                        ? Alignment.topLeft
                                        : Alignment.topRight,
                                    childAnchor: widget.reverse
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                    portal: Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.cyan),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ..._parseAttachments(context),
                                        if (widget.message.content.isNotEmpty)
                                          _buildTextBubble(context)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(MessageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  List<Widget> _parseAttachments(BuildContext context) {
    var transform = Matrix4.rotationY(widget.reverse ? pi : 0);

    return widget.message.attachments?.map((attachment) {
          final attachmentBuilder = widget.attachmentBuilders[attachment.type];
          print('attachment: ');
          print(attachment.width);
          if (attachmentBuilder == null) {
            return SizedBox();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: GestureDetector(
              onTap: () {},
              onLongPress: () {},
              child: Material(
                color: _getBackgroundColor(),
                borderRadius: widget.borderRadius,
                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: transform,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        attachmentBuilder(context, widget.message, attachment)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList() ??
        [];
  }

  Widget _buildTextBubble(BuildContext context) {
    var transform = Matrix4.rotationY(widget.reverse ? pi : 0);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 50),
      child: Material(
        borderRadius: widget.borderRadius,
        color: _getBackgroundColor(),
        child: Column(
          crossAxisAlignment: widget.reverse
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 8.0, right: 8.0, bottom: 2),
                child: Column(
                  children: [
                    MeasureSize(
                      onChange: (size) {
                        setState(() {
                          messageSize = size;
                        });
                      },
                      child: _buildText(context),
                    )
                  ],
                ),
              ),
            ),
            Transform(
                transform: transform,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 3.0, right: 3.0, bottom: 3.0),
                    child: SizedBox(
                      width: messageSize.width + 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.Hm('ru_RU')
                                .format(widget.message.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: _getSubtitleColor(),
                            ),
                          ),
                          SizedBox(width: 5),
                          if (widget.reverse)
                            Icon(
                                widget.message.read ?? false
                                    ? Icons.done_all
                                    : Icons.check,
                                color: _getSubtitleColor(),
                                size: 14)
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Color _getSubtitleColor() {
    return (widget.reverse ? Colors.white : Colors.black).withOpacity(0.5);
  }

  // Widget _buildSendingIndicator(BuildContext context) {
  //   var transform = Matrix4.rotationY(widget.reverse ? pi : 0);

  //   return Transform.translate(
  //     offset: Offset(0, 4),
  //     child: Transform(
  //       transform: transform,
  //       alignment: Alignment.center,
  //       child: SendingIndicator(message: widget.message),
  //     ),
  //   );
  // }

  Color _getBackgroundColor() {
    return widget.reverse
        ? defaultTheme.messageBackgroundColor!
        : defaultTheme.otherMessageBackgroundColor!;
  }

  Widget _buildText(BuildContext context) {
    return MessageText(
      messageTheme: MessageTheme(
        messageLinks: widget.reverse
            ? TextStyle(
                color: Colors.white.withOpacity(0.9),
                decoration: TextDecoration.underline)
            : TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline),
        content: TextStyle(color: widget.reverse ? Colors.white : Colors.black),
      ),
      message: widget.message,
      onLinkTap: (value) {},
    );
  }

  void _handleDismissStatusChanged(AnimationStatus status) {}

  void _updateMoveAnimation() {
    final end = _dragExtent.sign;
    _moveAnimation = _moveController.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(end, 0.0),
      ),
    );
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragUnderway = true;
    print('start');
    if (_moveController.isAnimating) {
      _dragExtent =
          _moveController.value * _overallDragAxisExtent * _dragExtent.sign;
      _moveController.stop();
    } else {
      _dragExtent = 0.0;
      _moveController.value = 0.0;
    }
    setState(() {
      _updateMoveAnimation();
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_moveController.isAnimating) {
      return;
    }
    final delta = details.primaryDelta!;
    final oldDragExtent = _dragExtent;
    if (_dragExtent + delta < 0 && _dragExtent + delta > -50) {
      _dragExtent += delta;
    }
    if (oldDragExtent.sign != _dragExtent.sign) {
      setState(() {
        _updateMoveAnimation();
      });
    }
    if (!_moveController.isAnimating) {
      _moveController.value = _dragExtent.abs() / _overallDragAxisExtent;
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_moveController.isAnimating) {
      return;
    }
    _dragUnderway = false;

    if (!_moveController.isDismissed) {
      if (_moveController.value > (_kDismissThreshold)) {
        print('make reply');
        _fadeInController.forward();
      } else {}
      _moveController.reverse();
    }
  }
}

const double _kDismissThreshold = 0.1;

class MessageText extends StatelessWidget {
  const MessageText({
    Key? key,
    required this.message,
    required this.messageTheme,
    required this.onLinkTap,
  }) : super(key: key);

  final Message message;
  final void Function(String) onLinkTap;
  final MessageTheme messageTheme;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: message.content,
      onTapLink: (text, link, title) {
        launchURL(context, link!);
      },
      styleSheet: MarkdownStyleSheet.fromTheme(
        Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: messageTheme.content?.color,
                decoration: messageTheme.content?.decoration,
                decorationColor: messageTheme.content?.decorationColor,
                decorationStyle: messageTheme.content?.decorationStyle,
                fontFamily: messageTheme.content?.fontFamily,
              ),
        ),
      ).copyWith(
        a: messageTheme.messageLinks,
        p: messageTheme.content,
      ),
    );
  }
}

class MessageTheme {
  final TextStyle? content;
  final TextStyle? messageAuthor;
  final TextStyle? messageLinks;
  final TextStyle? createdAt;
  final TextStyle? replies;
  final Color? messageBackgroundColor;
  final Color? otherMessageBackgroundColor;

  const MessageTheme(
      {this.replies,
      this.content,
      this.messageAuthor,
      this.messageLinks,
      this.messageBackgroundColor,
      this.createdAt,
      this.otherMessageBackgroundColor});

  MessageTheme copyWith({
    TextStyle? content,
    TextStyle? messageAuthor,
    TextStyle? messageLinks,
    TextStyle? createdAt,
    TextStyle? replies,
    Color? messageBackgroundColor,
    Color? otherMessageBackgroundColor,
  }) =>
      MessageTheme(
          content: content ?? this.content,
          messageAuthor: messageAuthor ?? this.messageAuthor,
          messageLinks: messageLinks ?? this.messageLinks,
          createdAt: createdAt ?? this.createdAt,
          messageBackgroundColor:
              messageBackgroundColor ?? this.messageBackgroundColor,
          replies: replies ?? this.replies,
          otherMessageBackgroundColor:
              otherMessageBackgroundColor ?? this.otherMessageBackgroundColor);
}

class SendingIndicator extends StatelessWidget {
  final Message message;
  const SendingIndicator({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.status == MessageSendingStatus.SENT) {
      return CircleAvatar(
        radius: 4,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 4,
        ),
      );
    }
    if (message.status == MessageSendingStatus.SENDING ||
        message.status == MessageSendingStatus.UPDATING) {
      return CircleAvatar(
        radius: 4,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.access_time,
          size: 4,
          color: Colors.white,
        ),
      );
    }
    if (message.status == MessageSendingStatus.FAILED ||
        message.status == MessageSendingStatus.FAILED_UPDATE ||
        message.status == MessageSendingStatus.FAILED_DELETE) {
      return CircleAvatar(
        radius: 4,
        backgroundColor: Color(0xffd0021B).withOpacity(.1),
        child: Icon(
          Icons.error_outline,
          size: 4,
          color: Colors.white,
        ),
      );
    }

    return SizedBox();
  }
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    var newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}
