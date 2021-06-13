import 'package:equatable/equatable.dart';
import 'package:moscow/domain/models/project.dart';

abstract class ProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProjectStateInitial extends ProjectState {}

class ProjectStateLoading extends ProjectState {}

class ProjectStateLoaded extends ProjectState {
  final List<Project> projects;
  final List<Project> myProjects;

  ProjectStateLoaded(this.projects, this.myProjects);

  @override
  List<Object?> get props => [...projects, ...myProjects];
}
