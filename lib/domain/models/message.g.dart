// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    id: json['id'] as String?,
    content: json['content'] as String,
    type: json['type'] as String?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    silent: json['silent'] as bool?,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    read: json['read'] as bool?,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'type': instance.type,
      'attachments': instance.attachments,
      'silent': instance.silent,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'read': instance.read,
      'user': instance.user,
    };
