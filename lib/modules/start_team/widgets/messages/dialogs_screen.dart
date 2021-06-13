import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:moscow/domain/models/attachment.dart';
import 'package:moscow/domain/models/message.dart';
import 'package:moscow/domain/models/room.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/modules/start_team/widgets/messages/dialog_page.dart';

class DialogsScreen extends StatelessWidget {
  DialogsScreen({Key? key}) : super(key: key);

  String stripText(String text, int len) {
    if (text.length >= len) {
      return text.substring(0, len - 3) + '...';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          ...List.generate(10, (index) {
            var room = Room(
                id: 10,
                target: User.empty,
                unread: 10,
                lastMessage: Message(
                    user: User.empty,
                    createdAt: DateTime.now(),
                    content: 'Привет, как дела?'));
            var target = room.target;

            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DialogPage(
                          user: User.empty,
                          room: room,
                          messages: [
                            Message(
                                id: '123123',
                                attachments: [
                                  Attachment(
                                      height: 1101,
                                      width: 1651,
                                      type: 'image',
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1548588627-f978862b85e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1651&q=80')
                                ],
                                user: User.empty,
                                createdAt: DateTime.now(),
                                content: 'Привет, как дела?'),
                            Message(
                                user: User.empty,
                                createdAt: DateTime.now(),
                                content: 'Привет, как дела?'),
                            Message(
                                user: User.empty,
                                createdAt: DateTime.now(),
                                content: 'Привет, как дела?')
                          ],
                        )));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: target.photoUrl != null
                      ? CachedNetworkImageProvider(target.photoUrl!)
                      : null,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Text(target.name,
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: _formatMessage(context, room.lastMessage),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    room.unread > 0
                        ? Container(
                            height: 25,
                            width: room.unread >= 10 ? 10.0 + 2 * 10 : 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Theme.of(context).accentColor),
                            child: Center(
                              child: Text(room.unread.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        : Container(
                            height: 1,
                            width: 1,
                          ),
                    Text(room.lastMessage != null
                        ? _formatDate(room.lastMessage!.createdAt.toLocal())
                        : ''),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  final mapTypeToString = {
    'image': 'Изображение',
    'video': 'Видео',
    'file': 'Файл',
    '': ''
  };

  String _formatDate(DateTime time) {
    var d1 = Jiffy(time);
    var d2 = Jiffy(DateTime.now());

    if (!d1.isSame(d2, Units.DAY)) {
      return DateFormat.E('ru_RU').format(time);
    }
    return DateFormat.Hm('ru_RU').format(time);
  }

  Widget _formatMessage(BuildContext context, Message? message) {
    if (message == null) return Text('');
    if (message.content.isEmpty) {
      return Text(mapTypeToString[message.attachments?.last.type ?? '']!,
          style: TextStyle(color: Theme.of(context).primaryColor));
    }
    return Text(stripText(message.content, 20),
        style: TextStyle(color: Colors.black.withOpacity(0.5)));
  }
}
