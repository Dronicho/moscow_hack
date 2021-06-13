import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/start_hub/bloc/hub_cubit.dart';
import 'package:moscow/modules/start_hub/bloc/hub_state.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_card.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_detail_page.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

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
                    ListView.builder(
                        itemCount: state.events.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrimaryButton(
                                child: Text(
                                  'Добавить мероприятия в календарь',
                                ),
                                onPressed: () {},
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: EventCard(
                                    event: state.events[index - 1],
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MeetingDetailPage(
                                                      event: state
                                                          .events[index - 1],
                                                      tag: index)));
                                    },
                                    tag: index)),
                          );
                        })
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

class EventsShimmer extends StatelessWidget {
  const EventsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
              ),
            )
          ],
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
