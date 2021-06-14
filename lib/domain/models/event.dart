import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';
part 'event.freezed.dart';

@freezed
class Event with _$Event {
  factory Event(
      {required String id,
      String? photoURL,
      required String name,
      required String description,
      required String type,
      @JsonKey(fromJson: _parseDate)
          required DateTime date,
      @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
          required List<TimeOfDay> times,
      required String fullDescription,
      required String location,
      required String email,
      required String website}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

DateTime _parseDate(int json) {
  print(json);
  return DateTime.fromMillisecondsSinceEpoch(json * 1000);
}

List<TimeOfDay> _parseTime(String json) {
  return json.split('-').map((e) {
    final values = e.split(':');
    return TimeOfDay(hour: int.parse(values[0]), minute: int.parse(values[1]));
  }).toList();
}

String _timeToJson(List<TimeOfDay> times) {
  return times.map((t) => t.toString()).join('-');
}
