// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    id: json['id'] as String,
    photoURL: json['photoURL'] as String?,
    name: json['name'] as String,
    description: json['description'] as String,
    type: json['type'] as String,
    date: _parseDate(json['date'] as String),
    times: _parseTime(json['time'] as String),
    fullDescription: json['fullDescription'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'photoURL': instance.photoURL,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'time': _timeToJson(instance.times),
      'fullDescription': instance.fullDescription,
      'location': instance.location,
      'email': instance.email,
      'website': instance.website,
    };
