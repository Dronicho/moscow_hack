// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$_$_ProjectFromJson(Map<String, dynamic> json) {
  return _$_Project(
    id: json['id'] as String?,
    name: json['name'] as String,
    photoURL: json['photoURL'] as String?,
    area: json['area'] as String,
    description: json['description'] as String,
    advantage: json['uniqueAdvantage'] as String,
    stage: json['readyStage'] as String,
    intellectualProperty: json['intellectualProperty'] as String,
    additionalMaterials: (json['additionalMaterials'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    needs: json['needs'] as String,
    marketApplication: json['marketApplication'] as String,
    competitors: json['competitors'] as String,
    dateStart: DateTime.parse(json['dateStart'] as String),
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    teamIds:
        (json['teamIDs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    requestedIds: (json['requestedIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    leaderId: json['teamCapitan'] as String?,
    experience: json['leadershipExperience'] as String,
    resources: json['resourcesAndInfrastructure'] as String,
    status: json['currentProjectStatus'] as String,
    model: json['implementationModel'] as String,
    plan: json['developmentPlan'] as String,
  );
}

Map<String, dynamic> _$_$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'area': instance.area,
      'description': instance.description,
      'uniqueAdvantage': instance.advantage,
      'readyStage': instance.stage,
      'intellectualProperty': instance.intellectualProperty,
      'additionalMaterials': instance.additionalMaterials,
      'needs': instance.needs,
      'marketApplication': instance.marketApplication,
      'competitors': instance.competitors,
      'dateStart': instance.dateStart.toIso8601String(),
      'skills': instance.skills,
      'teamIDs': instance.teamIds,
      'requestedIds': instance.requestedIds,
      'teamCapitan': instance.leaderId,
      'leadershipExperience': instance.experience,
      'resourcesAndInfrastructure': instance.resources,
      'currentProjectStatus': instance.status,
      'implementationModel': instance.model,
      'developmentPlan': instance.plan,
    };
