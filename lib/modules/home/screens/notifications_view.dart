import 'package:flutter/material.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  List<Notification> get notifications => [
        Notification(
            date: DateTime.now(),
            title: 'Новое мероприятие',
            content: '19 июня в 19:00 состоится Мероприятие 7'),
        Notification(
            date: DateTime.now(),
            title: 'Новое мероприятие',
            content: '19 июня в 19:00 состоится Мероприятие 7'),
        Notification(
            date: DateTime(2021, 6, 13, 12, 12, 12),
            title: 'Новое мероприятие',
            content: '19 июня в 19:00 состоится Мероприятие 7')
      ];

  final _format = DateFormat('dd MMMM', 'ru_RU');

  Map<DateTime, List<Notification>> _groupNotification(
      List<Notification> notifications) {
    final res = <DateTime, List<Notification>>{};
    notifications.forEach((element) {
      final date = element.date;
      final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
      if (!res.containsKey(startOfDay)) {
        res[startOfDay] = <Notification>[];
      }
      res[startOfDay]!.add(element);
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final ns = _groupNotification(notifications);

    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(16),
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
        final n = ns.entries.toList()[index - 1];
        return ListView.builder(
            shrinkWrap: true,
            itemCount: n.value.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text(_format.format(n.key),
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                );
              }
              return NotificationTile(
                notification: n.value[i - 1],
              );
            });
      },
      itemCount: ns.length + 1,
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
  final DateTime name;
  final List<Notification> notifications;

  NotificationGroup({required this.name, required this.notifications});
}

class Notification {
  final String title;
  final String content;
  final bool read;
  final DateTime date;

  Notification(
      {required this.title,
      required this.content,
      required this.date,
      this.read = false});
}
