import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/models/project.dart' show Project;
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/shimmers/container.dart';

import 'project_detail_view.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key, required this.projects}) : super(key: key);

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProjectCard(tag: index, project: projects[index]),
            ));
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({Key? key, required this.tag, required this.project})
      : super(key: key);

  final Object tag;
  final Project project;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.project.state);
    return Container(
      decoration: BoxDecoration(
          boxShadow: primaryShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            final bloc = context.read<ProjectCubit>();
            bloc.loadProject(widget.project);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider<ProjectCubit>.value(
                    value: bloc,
                    child: BlocBuilder<ProjectCubit, ProjectState>(
                        builder: (context, state) {
                      final s = state as ProjectStateLoaded;
                      final p = [...s.myProjects, ...s.projects].firstWhere(
                          (element) => element.id == widget.project.id);
                      return ProjectDetailView(tag: widget.tag, project: p);
                    }))));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       child: ,
                //     ),
                //     SizedBox(width: 5),
                //     Flexible(
                //       flex: 1,
                //       child: Column(
                //         children: [

                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                Hero(
                  tag: widget.tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 50),
                      imageUrl: widget.project.photoURL!,
                      placeholder: (context, url) => ContainerShimmer(height: 170),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(widget.project.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),

                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.project.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
