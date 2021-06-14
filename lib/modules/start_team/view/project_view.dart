import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/start_hub/view/hub_view.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart';
import 'package:moscow/modules/start_team/widgets/add_project/add_project_page.dart';
import 'package:moscow/modules/start_team/widgets/messages/dialogs_screen.dart';
import 'package:moscow/modules/start_team/widgets/project/projects_view.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/shimmers/event.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return DefaultTextStyle(
          style: TextStyle(color: Colors.black),
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'StartTeam',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        final oldContext = context;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddProjectPage(
                                bloc: oldContext.read<ProjectCubit>())));
                      }),
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                controller: DefaultTabController.of(context),
                tabs: [
                  Tab(
                      child: Text(
                    'Найти проекты',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    'Мои проекты',
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    'Мессенджер',
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
            ),
            body: BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
                if (state is ProjectStateLoading) {
                  return TabBarView(children: [
                    EventsShimmer(),
                    EventsShimmer(),
                    EventsShimmer(),
                  ]);
                }
                if (state is ProjectStateLoaded) {
                  return TabBarView(
                    children: [
                      ProjectsView(
                        projects: state.projects,
                      ),
                      ProjectsView(projects: state.myProjects),
                      DialogsScreen()
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        );
      }),
    );
  }
}
