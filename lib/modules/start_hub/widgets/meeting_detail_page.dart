import 'package:flutter/material.dart';
import 'package:moscow/domain/models/event.dart';
import 'package:moscow/modules/home/screens/profile/profile_page.dart';
import 'package:moscow/widgets/widgets.dart';

import 'meeting_card.dart';

class MeetingDetailPage extends StatefulWidget {
  const MeetingDetailPage({Key? key, required this.tag, required this.event})
      : super(key: key);
  final Object tag;
  final Event event;

  @override
  _MeetingDetailPageState createState() => _MeetingDetailPageState();
}

class _MeetingDetailPageState extends State<MeetingDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Мероприятие 1', style: TextStyle(fontSize: 32)),
            shadowColor: Colors.transparent),
        body: SafeArea(
          top: false,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.tag,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EventCard(
                      onPressed: () {},
                      event: widget.event,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16, bottom: 4),
                  child: Text('Описание', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InfoCard(
                    name: 'name',
                    title:
                        'Описание проекта а описание проект да карточка с компетенциями очень важная особенная и нужная Описание проекта а описание проект да карточка с компетенциями очень важная особенная и нужная',
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    child: Text('Зарегистрироваться'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
