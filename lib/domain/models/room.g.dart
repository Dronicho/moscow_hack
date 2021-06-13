// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$_$_RoomFromJson(Map<String, dynamic> json) {
  return _$_Room(
    id: json['id'] as int,
    target: User.fromJson(json['target'] as Map<String, dynamic>),
    unread: json['unread'] as int? ?? 0,
    otherLastRead: json['otherLastRead'] == null
        ? null
        : DateTime.parse(json['otherLastRead'] as String),
    lastMessage: json['lastMessage'] == null
        ? null
        : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'target': instance.target,
      'unread': instance.unread,
      'otherLastRead': instance.otherLastRead?.toIso8601String(),
      'lastMessage': instance.lastMessage,
    };
