import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/service/widgets/service_card.dart';
import 'package:moscow/modules/start_hub/bloc/hub_cubit.dart';
import 'package:moscow/modules/start_hub/bloc/hub_state.dart';
import 'package:moscow/modules/start_hub/view/hub_page.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_card.dart';
import 'package:moscow/modules/start_hub/widgets/meeting_detail_page.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/view/project_page.dart';
import 'package:moscow/modules/start_team/view/project_view.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> get _services => [
        ServiceCard(
            title: 'StartHub',
            shortTile: Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<EventCubit, EventState>(
                      builder: (context, state) {
                    print(state);
                    if (state is EventStateLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 150,
                          color: Colors.white,
                        ),
                      );
                    }
                    if (state is EventStateLoaded) {
                      return EventCard(
                          tag: 'main',
                          event: state.events[0],
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MeetingDetailPage(
                                    tag: 'main', event: state.events[0])));
                          });
                    }
                    return Container();
                  })),
            ),
            detailPage: StartHubPage(bloc: context.read<EventCubit>())),
        ServiceCard(
            title: 'Проекты',
            shortTile: PrimaryButton(
              child: Text('20 новых запросов на проект'),
              onPressed: () {},
            ),
            detailPage: ProjectPage(bloc: context.read<ProjectCubit>()))
      ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _services.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сервисы',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: OpenContainer(
                    openBuilder: (context, close) => Scaffold(
                      appBar: AppBar(
                        leading: CloseButton(
                          onPressed: close,
                        ),
                      ),
                    ),
                    closedBuilder: (context, open) => IconButton(
                      onPressed: open,
                      icon: Icon(Icons.search),
                      iconSize: 32,
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _services[index - 1],
        );
      },
    );
  }
}