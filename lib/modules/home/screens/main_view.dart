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
import 'package:moscow/modules/start_team/bloc/project_state.dart';
import 'package:moscow/modules/start_team/view/project_page.dart';
import 'package:moscow/modules/start_team/view/project_view.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/shimmers/container.dart';
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
            icon: Icons.groups,
            description: 'Нетворкинг',
            title: 'StartHub',
            shortTile: Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<EventCubit, EventState>(
                      builder: (context, state) {
                    if (state is EventStateLoading) {
                      return ContainerShimmer();
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
            description: 'Проекты физических лиц',
            title: 'StartTeam',
            icon: Icons.touch_app,
            shortTile: BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
                if (state is ProjectStateLoading) {
                  return Shimmer.fromColors(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ],
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!);
                }
                if (state is ProjectStateLoaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Column(children: [
                            Text(state.myProjects.length.toString(),
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w500)),
                            Text('Ваших проекта',
                                style: TextStyle(fontSize: 10))
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Column(children: [
                            Text(
                                state.myProjects
                                    .fold<int>(
                                        0,
                                        (previousValue, element) =>
                                            previousValue +
                                            (element.requestedIds?.length ?? 0))
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w500)),
                            Text('Новых заявок', style: TextStyle(fontSize: 10))
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Column(children: [
                            Text('7',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w500)),
                            Text('кандидатов', style: TextStyle(fontSize: 10))
                          ]),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
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
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сервисы',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      iconSize: 32,
                    ))
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

