import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:moscow/domain/models/message.dart';
import 'package:moscow/domain/models/room.dart';
import 'new_message.dart';

class MessagesList extends StatefulWidget {
  final Room room;
  final List<Message> messages;
  MessagesList({Key? key, required this.room, required this.messages})
      : super(key: key);

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late AnimationController _overlayController;
  bool timeoutStarted = false;
  Timer? timer;
  OverlayEntry? actionsOveray;
  bool scrolled = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: theme.primaryColor.withOpacity(0.08)),
        NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                print(_scrollController.position.userScrollDirection);
                timer?.cancel();
                _animationController.forward();
              } else if (notification is ScrollEndNotification) {
                timeoutStarted = true;
                timer = Timer(
                    Duration(milliseconds: 300), _animationController.reverse);
              }
              return true;
            },
            child: Portal(
              child: ListView.custom(
                key: Key('MessagesList'),
                controller: _scrollController,
                reverse: true,
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var messages = widget.messages;
                    var message = messages[index];
                    // final nextMessage = index > 0 ? messages[index - 1] : null;
                    var isMe = Random().nextBool();
                    if (index < messages.length - 1 &&
                        messages[index]
                                .createdAt
                                .difference(messages[index + 1].createdAt)
                                .inHours >
                            0) {}

                    message = message.copyWith(
                        createdAt: message.createdAt.toLocal());

                    var messageWidget = MessageWidget(
                        onMessageTap: (message) {
                          print('built');
                          actionsOveray = _buildActionsOverlay();
                          Overlay.of(context)?.insert(actionsOveray!);
                        },
                        key: ValueKey<String>('MESSAGE_${message.id}'),
                        message: message,
                        reverse: isMe);

                    if (index == -1) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      'Новые сообщения',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          messageWidget
                        ],
                      );
                    }

                    // if (nextMessage != null &&
                    //     !Jiffy(message.createdAt.toLocal()).isSame(
                    //         nextMessage.createdAt.toLocal(), Units.DAY)) {
                    //   return Column(
                    //     children: [
                    //       messageWidget,
                    //       DateDivider(
                    //         dateTime: nextMessage.createdAt.toLocal(),
                    //       ),
                    //     ],
                    //   );
                    // }

                    return messageWidget;
                  },
                  childCount: widget.messages.length,
                  findChildIndexCallback: (Key key) {
                    // final ValueKey<String> k = ValueKey(key);
                    // return messages
                    //     .indexWhere((e) => 'MESSAGE_${e.id}' == k.value);
                  },
                ),
              ),
            )),
        // Positioned(
        //   top: 15,
        //   left: 0,
        //   right: 0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       FadeTransition(
        //         opacity: _animationController,
        //         child: Container(
        //           decoration: BoxDecoration(
        //               color: primaryColor.withOpacity(0.4),
        //               borderRadius: BorderRadius.circular(32)),
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 10.0, vertical: 2),
        //             child: Center(
        //               child: Text('', style: TextStyle(color: Colors.white)),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }

  T? getMeta<T>(double x, double y) {
    var renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset(x, y));

    var result = HitTestResult();
    WidgetsBinding.instance!.hitTest(result, offset);

    for (var i in result.path) {
      if (i.target is RenderMetaData) {
        var d = i.target as RenderMetaData;
        if (d.metaData is T) {
          return d.metaData as T;
        }
      }
    }
    return null;
  }

  void _closeOverlay() async {
    await _overlayController.reverse();
    actionsOveray?.remove();
    actionsOveray = null;
  }

  OverlayEntry _buildActionsOverlay() {
    _overlayController.forward();

    return OverlayEntry(
      builder: (context) => AnimatedBuilder(
          animation: _overlayController,
          child: GestureDetector(
            onTap: _closeOverlay,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          onTap: () {},
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Изменить'),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          onTap: () async {
                            _closeOverlay();
                          },
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Удалить'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          builder: (context, child) {
            return FadeTransition(
              opacity: _overlayController,
              child: child,
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    _overlayController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100), value: 0);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          // widget._controller.focusNode.unfocus();
        }
      });
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 50),
        reverseDuration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    timer?.cancel();
    _scrollController.dispose();
    _animationController.dispose();

    super.dispose();
  }
}
