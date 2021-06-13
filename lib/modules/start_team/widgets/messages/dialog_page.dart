import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moscow/domain/models/message.dart';
import 'package:moscow/domain/models/room.dart';
import 'package:moscow/domain/models/user.dart';

import 'widgets/new_input.dart';
import 'widgets/messages_list.dart';

class DialogPage extends StatefulWidget {
  final User user;
  final Room room;
  final List<Message> messages;
  DialogPage(
      {Key? key,
      required this.user,
      required this.room,
      required this.messages})
      : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          elevation: 2,
          backgroundColor: Colors.white,
          leadingWidth: 50,
          leading: IconButton(
            icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.fio,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          )),
      body: Column(
        children: [
          Flexible(
            child: MessagesList(
              room: widget.room,
              messages: widget.messages
            ),
          ),
          MessageInput()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
