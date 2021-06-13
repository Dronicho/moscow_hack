// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
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
      required String website}) {
    return _Event(
      id: id,
      photoURL: photoURL,
      name: name,
      description: description,
      type: type,
      date: date,
      times: times,
      fullDescription: fullDescription,
      location: location,
      email: email,
      website: website,
    );
  }

  Event fromJson(Map<String, Object> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDate)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
  List<TimeOfDay> get times => throw _privateConstructorUsedError;
  String get fullDescription => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? photoURL,
      String name,
      String description,
      String type,
      @JsonKey(fromJson: _parseDate)
          DateTime date,
      @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
          List<TimeOfDay> times,
      String fullDescription,
      String location,
      String email,
      String website});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? photoURL = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? times = freezed,
    Object? fullDescription = freezed,
    Object? location = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      fullDescription: fullDescription == freezed
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? photoURL,
      String name,
      String description,
      String type,
      @JsonKey(fromJson: _parseDate)
          DateTime date,
      @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
          List<TimeOfDay> times,
      String fullDescription,
      String location,
      String email,
      String website});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? photoURL = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? times = freezed,
    Object? fullDescription = freezed,
    Object? location = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      fullDescription: fullDescription == freezed
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {required this.id,
      this.photoURL,
      required this.name,
      required this.description,
      required this.type,
      @JsonKey(fromJson: _parseDate)
          required this.date,
      @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
          required this.times,
      required this.fullDescription,
      required this.location,
      required this.email,
      required this.website});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final String id;
  @override
  final String? photoURL;
  @override
  final String name;
  @override
  final String description;
  @override
  final String type;
  @override
  @JsonKey(fromJson: _parseDate)
  final DateTime date;
  @override
  @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
  final List<TimeOfDay> times;
  @override
  final String fullDescription;
  @override
  final String location;
  @override
  final String email;
  @override
  final String website;

  @override
  String toString() {
    return 'Event(id: $id, photoURL: $photoURL, name: $name, description: $description, type: $type, date: $date, times: $times, fullDescription: $fullDescription, location: $location, email: $email, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)) &&
            (identical(other.fullDescription, fullDescription) ||
                const DeepCollectionEquality()
                    .equals(other.fullDescription, fullDescription)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality().equals(other.website, website)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(photoURL) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(times) ^
      const DeepCollectionEquality().hash(fullDescription) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(website);

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  factory _Event(
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
      required String website}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _parseDate)
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _parseTime, toJson: _timeToJson, name: 'time')
  List<TimeOfDay> get times => throw _privateConstructorUsedError;
  @override
  String get fullDescription => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get website => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
