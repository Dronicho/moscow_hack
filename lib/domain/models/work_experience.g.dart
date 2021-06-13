// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkExperience _$_$_WorkExperienceFromJson(Map<String, dynamic> json) {
  return _$_WorkExperience(
    name: json['companyName'] as String,
    position: json['position'] as String,
    dateStart: json['dateStart'] == null
        ? null
        : DateTime.parse(json['dateStart'] as String),
    dateEnd: json['dateEnd'] == null
        ? null
        : DateTime.parse(json['dateEnd'] as String),
    responsibilities: (json['responsibilities'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_WorkExperienceToJson(_$_WorkExperience instance) =>
    <String, dynamic>{
      'companyName': instance.name,
      'position': instance.position,
      'dateStart': instance.dateStart?.toIso8601String(),
      'dateEnd': instance.dateEnd?.toIso8601String(),
      'responsibilities': instance.responsibilities,
    };

_$_Education _$_$_EducationFromJson(Map<String, dynamic> json) {
  return _$_Education(
    name: json['name'] as String,
    specialty: json['specialty'] as String,
    degree: json['degree'] as String,
    dateStart: json['dateStart'] == null
        ? null
        : DateTime.parse(json['dateStart'] as String),
    dateEnd: json['dateEnd'] == null
        ? null
        : DateTime.parse(json['dateEnd'] as String),
  );
}

Map<String, dynamic> _$_$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'name': instance.name,
      'specialty': instance.specialty,
      'degree': instance.degree,
      'dateStart': instance.dateStart?.toIso8601String(),
      'dateEnd': instance.dateEnd?.toIso8601String(),
    };
