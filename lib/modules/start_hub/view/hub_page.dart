import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/start_hub/bloc/hub_cubit.dart';
import 'package:moscow/modules/start_hub/view/hub_view.dart';

class StartHubPage extends StatelessWidget {
  const StartHubPage({Key? key, required this.bloc}) : super(key: key);
  final EventCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: bloc, child: StartHubView());
  }
}
