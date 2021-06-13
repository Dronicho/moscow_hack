import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/view/project_view.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key, required this.bloc}) : super(key: key);

  final ProjectCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: ProjectView()
    );
  }
}
