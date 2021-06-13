import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/blocs/users/bloc/users_bloc.dart';
import 'package:moscow/domain/repositories/event.dart';
import 'package:moscow/domain/repositories/project.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/modules/start_hub/bloc/hub_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => EventCubit(EventRepository())..loadEvents()),
      BlocProvider(
          create: (context) => ProjectCubit(ProjectRepository(),
              context.read<AppCubit>(), context.read<UsersCubit>())
            ..loadProjects())
    ], child: HomeView());
  }
}
