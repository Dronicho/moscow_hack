import 'package:bloc/bloc.dart';
import 'package:moscow/domain/blocs/users/bloc/users_bloc.dart';
import 'package:moscow/domain/models/project.dart' as model;
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/repositories/project.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/modules/start_hub/bloc/hub_state.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._repository, this.bloc, this._usersCubit)
      : super(ProjectStateInitial());

  ProjectRepository _repository;
  UsersCubit _usersCubit;
  AppCubit bloc;

  Future<void> addRequest(model.Project project, User user) async {
    await _repository.addRequest(project);
    final newProjects = (state as ProjectStateLoaded).projects.map((e) {
      if (e.id == project.id) {
        return e.copyWith(requestedIds: [...(e.requestedIds ?? []), user.id]);
      }
      return e;
    }).toList();
    emit(ProjectStateLoaded(
        newProjects, (state as ProjectStateLoaded).myProjects));
  }

  Future<void> acceptRequest(model.Project project, User user) async {
    await _repository.acceptRequest(project, user);
  }

  void loadProjects() async {
    emit(ProjectStateLoading());
    final projects = await _repository.loadProjects();
    final myProjects = (await _repository.loadProjects('/my')).map((e) {
      return e.copyWith(
          isOwner: e.leaderId == bloc.state.user.id, isMember: true);
    }).toList();

    emit(ProjectStateLoaded(projects, myProjects));
  }

  void removeRequest(model.Project project, User user) async {
    final newMyProjects = (state as ProjectStateLoaded).myProjects.map((e) {
      if (e.id == project.id) {
        return e.copyWith(applicants: e.applicants!..remove(user));
      }
      return e;
    }).toList();
    await _repository.removeRequest(project, user);
    emit(ProjectStateLoaded(
        (state as ProjectStateLoaded).projects, newMyProjects));
  }

  Future loadProject(model.Project project) async {
    final currentState = state as ProjectStateLoaded;
    emit(ProjectStateLoaded(
        currentState.projects.map((e) {
          if (e.id == project.id) {
            return e.copyWith(state: model.ProjectState.loading);
          }
          return e;
        }).toList(),
        currentState.myProjects.map((e) {
          if (e.id == project.id) {
            return e.copyWith(state: model.ProjectState.loading);
          }
          return e;
        }).toList()));
    final owner = await _usersCubit.get(project.leaderId!);
    var members = <User>[];
    var applicants = <User>[];
    if (project.teamIds != null)
      for (var i = 0; i < project.teamIds!.length; i++) {
        final u = await _usersCubit.get(project.teamIds![i]);
        if (u != null) members.add(u);
      }
    print(project.requestedIds);
    if (project.requestedIds != null)
      for (var i = 0; i < project.requestedIds!.length; i++) {
        final u = await _usersCubit.get(project.requestedIds![i]);
        if (u != null) applicants.add(u);
      }
    final newProjects = currentState.projects.map((p) {
      if (p.id == project.id)
        return p.copyWith(
            owner: owner, members: members, state: model.ProjectState.loaded);
      return p;
    }).toList();
    final newMyProjects = currentState.myProjects.map((p) {
      if (p.id == project.id)
        return p.copyWith(
            owner: owner,
            members: members,
            applicants: applicants,
            state: model.ProjectState.loaded);
      return p;
    }).toList();
    emit(ProjectStateLoaded(newProjects, newMyProjects));
  }
}
