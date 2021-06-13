import 'package:bloc/bloc.dart';
import 'package:moscow/domain/models/project.dart';
import 'package:moscow/domain/repositories/project.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';

import 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit(this.bloc, this.repository)
      : super(AddProjectState(
            project: Project(
          advantage: '',
          description: '',
          name: '',
          experience: '',
          model: '',
          resources: '',
          photoURL: '',
          area: '',
          plan: '',
          stage: '',
          status: '',
          competitors: '',
          intellectualProperty: '',
          marketApplication: '',
          needs: '',
          dateStart: DateTime.now(),
        )));

  final ProjectCubit bloc;
  final ProjectRepository repository;

  void stateChanged(Project project) {
    emit(state.copyWith(project: project));
  }

  Future<void> addProject() async {
    emit(state.copyWith(loading: true));
    await repository.addProject(state);
    emit(state.copyWith(loading: false));
  }
}
