import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/project.dart';

part 'add_project_state.freezed.dart';

@freezed
class AddProjectState with _$AddProjectState {
  factory AddProjectState(
      {required Project project,
      @Default(false) bool loading}) = _AddProjectState;
}
