import 'package:flutter/material.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/widgets.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  List<NotificationGroup> get notifications => [
        NotificationGroup(name: 'StartHub', notifications: [
          Notification(
              title: 'Новое мероприятие',
              content: '19 июня в 19:00 состоится Мероприятие 7')
        ]),
        NotificationGroup(name: 'StartHub', notifications: [
          Notification(
              title: 'Новое мероприятие',
              content: '19 июня в 19:00 состоится Мероприятие 7')
        ])
      ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Уведомления',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 32)),
                SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  child: Text('Отметить все как прочитанные'),
                  onPressed: () {},
                )
              ],
            ),
          );
        }
        final n = notifications[index - 1];
        return ListView.builder(
            shrinkWrap: true,
            itemCount: n.notifications.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text(n.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                );
              }
              return NotificationTile(
                notification: n.notifications[i - 1],
              );
            });
      },
      itemCount: notifications.length + 1,
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key, required this.notification})
      : super(key: key);
  final Notification notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PrimaryIconButton(
        icon: Icons.add,
        onPressed: () {},
      ),
      title: Text(notification.title),
      subtitle: Text(notification.content),
    );
  }
}

class NotificationGroup {
  final String name;
  final List<Notification> notifications;

  NotificationGroup({required this.name, required this.notifications});
}

class Notification {
  final String title;
  final String content;
  final bool read;

  Notification({required this.title, required this.content, this.read = false});
}
