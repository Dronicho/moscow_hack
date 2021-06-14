// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    fio: json['fio'] as String,
    email: json['email'] as String,
    skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    stats: UserStats.fromJson(json['stats'] as Map<String, dynamic>),
    requestedProjects: (json['requestedProjects'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    photoUrl: json['photoURL'] as String?,
    about: json['about'] as String?,
    phone: json['phone'] as String?,
    socials: json['socials'] as String?,
    snils: json['SNILS'] as String?,
    work: (json['workExperience'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : WorkExperience.fromJson(e as Map<String, dynamic>))
        .toList(),
    education: (json['education'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Education.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'fio': instance.fio,
      'email': instance.email,
      'skills': instance.skills,
      'stats': instance.stats,
      'requestedProjects': instance.requestedProjects,
      'createdAt': instance.createdAt?.toIso8601String(),
      'photoURL': instance.photoUrl,
      'about': instance.about,
      'phone': instance.phone,
      'socials': instance.socials,
      'SNILS': instance.snils,
      'workExperience': instance.work,
      'education': instance.education,
    };

_$_UserStats _$_$_UserStatsFromJson(Map<String, dynamic> json) {
  return _$_UserStats(
    friendly: json['friendly'] as int,
    competent: json['competent'] as int,
    leadership: json['leadership'] as int,
  );
}

Map<String, dynamic> _$_$_UserStatsToJson(_$_UserStats instance) =>
    <String, dynamic>{
      'friendly': instance.friendly,
      'competent': instance.competent,
      'leadership': instance.leadership,
    };
