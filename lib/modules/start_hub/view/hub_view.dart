import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/models/event.dart' as model;
import 'package:moscow/modules/start_hub/bloc/hub_cubit.dart';
import 'package:moscow/modules/start_hub/bloc/hub_state.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_card.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_detail_page.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/shimmers/event.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/timezone.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class StartHubView extends StatelessWidget {
  const StartHubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text('StartHub'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryIconButton(
                    icon: Icons.notifications, onPressed: () {}),
              )
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text('Лента мероприятий'),
                ),
                Tab(
                  child: Text('Мои мероприятия'),
                )
              ],
            ),
          ),
          body: BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              if (state is EventStateLoading)
                return TabBarView(children: [EventsShimmer(), EventsShimmer()]);

              if (state is EventStateLoaded)
                return TabBarView(
                  children: [
                    ListView.builder(
                        itemCount: state.events.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: EventCard(
                                      event: state.events[index],
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MeetingDetailPage(
                                                        event:
                                                            state.events[index],
                                                        tag: index)));
                                      },
                                      tag: index)),
                            )),
                    MyEventsView()
                  ],
                );
              return Container();
            },
          ),
        );
      }),
    );
  }
}

class MyEventsView extends StatefulWidget {
  const MyEventsView({
    Key? key,
  }) : super(key: key);

  @override
  _MyEventsViewState createState() => _MyEventsViewState();
}

class _MyEventsViewState extends State<MyEventsView> {
  late DeviceCalendarPlugin _deviceCalendarPlugin;

  @override
  void initState() {
    super.initState();
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }

  Future<void> _addEvent(model.Event event) async {
    final _timezone = await FlutterNativeTimezone.getLocalTimezone();
    final permission = await _deviceCalendarPlugin.requestPermissions();
    if (permission.data != null && permission.data!) {
      final calendars = await _deviceCalendarPlugin.retrieveCalendars();
      final element = calendars.data![1];
      print(event.date);
      final start = TZDateTime.from(
          DateTime(event.date.year, event.date.month, event.date.day,
              event.times[0].hour, event.times[0].minute),
          timeZoneDatabase.locations[_timezone]!);

      final duration = (event.times[1].hour * 60 + event.times[1].minute) -
          (event.times[0].hour * 60 + event.times[0].minute);
      final res = await _deviceCalendarPlugin.createOrUpdateEvent(Event(
          element.id,
          availability: Availability.Busy,
          title: event.name,
          start: start,
          end: start.add(Duration(minutes: duration))));
      print(res?.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, s) {
        final state = s as EventStateLoaded;
        return ListView.builder(
            itemCount: state.events.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    child: Text(
                      'Добавить мероприятия в календарь',
                    ),
                    onPressed: () async {
                      for (var i = 0; i < state.events.length; i++) {
                        await _addEvent(state.events[i]);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Все мероприятия успешно добавлены')));
                    },
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: EventCard(
                        event: state.events[index - 1],
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MeetingDetailPage(
                                  event: state.events[index - 1], tag: index)));
                        },
                        tag: index)),
              );
            });
      },
    );
  }
}
