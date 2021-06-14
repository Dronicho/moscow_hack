import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/sending_attachment.dart';
import 'package:moscow/modules/start_team/widgets/add_project/add_project_view.dart';

import 'user.dart';

part 'project.g.dart';
part 'project.freezed.dart';

@freezed
class Project with _$Project {
  factory Project(
      {String? id,
      required String name,
      String? photoURL,
      required String area,
      required String description,
      @JsonKey(name: 'uniqueAdvantage')
          required String advantage,
      @JsonKey(name: 'readyStage')
          required String stage,
      required String intellectualProperty,
      List<String>? additionalMaterials,
      required String needs,
      required String marketApplication,
      required String competitors,
      required DateTime dateStart,
      List<String>? skills,
      @JsonKey(name: 'teamIDs')
          List<String>? teamIds,
      @JsonKey(name: 'requestedIds')
          List<String>? requestedIds,
      @JsonKey(name: 'teamCapitan')
          String? leaderId,
      @JsonKey(ignore: true)
      @Default(null)
          SendingAttachment? localImage,
      @JsonKey(ignore: true)
      @Default(null)
          List<SendingAttachment>? localMaterials,
      @JsonKey(ignore: true)
      @Default(null)
          User? owner,
      @JsonKey(ignore: true)
      @Default(null)
          List<User>? members,
      @JsonKey(ignore: true)
      @Default(null)
          List<User>? applicants,
      @JsonKey(ignore: true)
      @Default(false)
          bool isOwner,
      @JsonKey(ignore: true)
      @Default(false)
          bool isMember,
      @JsonKey(ignore: true)
      @Default(ProjectState.none)
          state,
      @JsonKey(name: 'leadershipExperience')
          required String experience,
      @JsonKey(name: 'resourcesAndInfrastructure')
          required String resources,
      @JsonKey(name: 'currentProjectStatus')
          required String status,
      @JsonKey(name: 'implementationModel')
          required String model,
      @JsonKey(name: 'developmentPlan')
          required String plan}) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

enum ProjectState { loading, loaded, none }
