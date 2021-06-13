import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/repositories/project.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/widgets/add_project/add_project_view.dart';
import 'package:moscow/modules/start_team/widgets/add_project/bloc/add_project_cubit.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({Key? key, required this.bloc}) : super(key: key);

  final ProjectCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProjectCubit(bloc, ProjectRepository()),
      child: AddProjectView(),
    );
  }
}
