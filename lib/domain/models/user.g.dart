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
    photoUrl: json['photoUrl'] as String?,
    about: json['about'] as String?,
    phone: json['phone'] as String?,
    socials: json['socials'] as String?,
    snils: json['SNILS'] as String?,
    work: (json['work'] as List<dynamic>?)
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
      'photoUrl': instance.photoUrl,
      'about': instance.about,
      'phone': instance.phone,
      'socials': instance.socials,
      'SNILS': instance.snils,
      'work': instance.work,
      'education': instance.education,
    };
