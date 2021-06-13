// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'work_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) {
  return _WorkExperience.fromJson(json);
}

/// @nodoc
class _$WorkExperienceTearOff {
  const _$WorkExperienceTearOff();

  _WorkExperience call(
      {@JsonKey(name: 'companyName') required String name,
      required String position,
      DateTime? dateStart,
      DateTime? dateEnd,
      required List<String> responsibilities}) {
    return _WorkExperience(
      name: name,
      position: position,
      dateStart: dateStart,
      dateEnd: dateEnd,
      responsibilities: responsibilities,
    );
  }

  WorkExperience fromJson(Map<String, Object> json) {
    return WorkExperience.fromJson(json);
  }
}

/// @nodoc
const $WorkExperience = _$WorkExperienceTearOff();

/// @nodoc
mixin _$WorkExperience {
  @JsonKey(name: 'companyName')
  String get name => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  List<String> get responsibilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkExperienceCopyWith<WorkExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkExperienceCopyWith<$Res> {
  factory $WorkExperienceCopyWith(
          WorkExperience value, $Res Function(WorkExperience) then) =
      _$WorkExperienceCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'companyName') String name,
      String position,
      DateTime? dateStart,
      DateTime? dateEnd,
      List<String> responsibilities});
}

/// @nodoc
class _$WorkExperienceCopyWithImpl<$Res>
    implements $WorkExperienceCopyWith<$Res> {
  _$WorkExperienceCopyWithImpl(this._value, this._then);

  final WorkExperience _value;
  // ignore: unused_field
  final $Res Function(WorkExperience) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? position = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? responsibilities = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      responsibilities: responsibilities == freezed
          ? _value.responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$WorkExperienceCopyWith<$Res>
    implements $WorkExperienceCopyWith<$Res> {
  factory _$WorkExperienceCopyWith(
          _WorkExperience value, $Res Function(_WorkExperience) then) =
      __$WorkExperienceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'companyName') String name,
      String position,
      DateTime? dateStart,
      DateTime? dateEnd,
      List<String> responsibilities});
}

/// @nodoc
class __$WorkExperienceCopyWithImpl<$Res>
    extends _$WorkExperienceCopyWithImpl<$Res>
    implements _$WorkExperienceCopyWith<$Res> {
  __$WorkExperienceCopyWithImpl(
      _WorkExperience _value, $Res Function(_WorkExperience) _then)
      : super(_value, (v) => _then(v as _WorkExperience));

  @override
  _WorkExperience get _value => super._value as _WorkExperience;

  @override
  $Res call({
    Object? name = freezed,
    Object? position = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? responsibilities = freezed,
  }) {
    return _then(_WorkExperience(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      responsibilities: responsibilities == freezed
          ? _value.responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: true)
class _$_WorkExperience implements _WorkExperience {
  const _$_WorkExperience(
      {@JsonKey(name: 'companyName') required this.name,
      required this.position,
      this.dateStart,
      this.dateEnd,
      required this.responsibilities});

  factory _$_WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$_$_WorkExperienceFromJson(json);

  @override
  @JsonKey(name: 'companyName')
  final String name;
  @override
  final String position;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;
  @override
  final List<String> responsibilities;

  @override
  String toString() {
    return 'WorkExperience(name: $name, position: $position, dateStart: $dateStart, dateEnd: $dateEnd, responsibilities: $responsibilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkExperience &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.dateStart, dateStart) ||
                const DeepCollectionEquality()
                    .equals(other.dateStart, dateStart)) &&
            (identical(other.dateEnd, dateEnd) ||
                const DeepCollectionEquality()
                    .equals(other.dateEnd, dateEnd)) &&
            (identical(other.responsibilities, responsibilities) ||
                const DeepCollectionEquality()
                    .equals(other.responsibilities, responsibilities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(dateStart) ^
      const DeepCollectionEquality().hash(dateEnd) ^
      const DeepCollectionEquality().hash(responsibilities);

  @JsonKey(ignore: true)
  @override
  _$WorkExperienceCopyWith<_WorkExperience> get copyWith =>
      __$WorkExperienceCopyWithImpl<_WorkExperience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WorkExperienceToJson(this);
  }
}

abstract class _WorkExperience implements WorkExperience {
  const factory _WorkExperience(
      {@JsonKey(name: 'companyName') required String name,
      required String position,
      DateTime? dateStart,
      DateTime? dateEnd,
      required List<String> responsibilities}) = _$_WorkExperience;

  factory _WorkExperience.fromJson(Map<String, dynamic> json) =
      _$_WorkExperience.fromJson;

  @override
  @JsonKey(name: 'companyName')
  String get name => throw _privateConstructorUsedError;
  @override
  String get position => throw _privateConstructorUsedError;
  @override
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @override
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  @override
  List<String> get responsibilities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkExperienceCopyWith<_WorkExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
class _$EducationTearOff {
  const _$EducationTearOff();

  _Education call(
      {required String name,
      required String specialty,
      required String degree,
      DateTime? dateStart,
      DateTime? dateEnd}) {
    return _Education(
      name: name,
      specialty: specialty,
      degree: degree,
      dateStart: dateStart,
      dateEnd: dateEnd,
    );
  }

  Education fromJson(Map<String, Object> json) {
    return Education.fromJson(json);
  }
}

/// @nodoc
const $Education = _$EducationTearOff();

/// @nodoc
mixin _$Education {
  String get name => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;
  DateTime? get dateStart => throw _privateConstructorUsedError;
  DateTime? get dateEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String specialty,
      String degree,
      DateTime? dateStart,
      DateTime? dateEnd});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res> implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  final Education _value;
  // ignore: unused_field
  final $Res Function(Education) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? specialty = freezed,
    Object? degree = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: specialty == freezed
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      degree: degree == freezed
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$EducationCopyWith(
          _Education value, $Res Function(_Education) then) =
      __$EducationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String specialty,
      String degree,
      DateTime? dateStart,
      DateTime? dateEnd});
}

/// @nodoc
class __$EducationCopyWithImpl<$Res> extends _$EducationCopyWithImpl<$Res>
    implements _$EducationCopyWith<$Res> {
  __$EducationCopyWithImpl(_Education _value, $Res Function(_Education) _then)
      : super(_value, (v) => _then(v as _Education));

  @override
  _Education get _value => super._value as _Education;

  @override
  $Res call({
    Object? name = freezed,
    Object? specialty = freezed,
    Object? degree = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
  }) {
    return _then(_Education(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: specialty == freezed
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      degree: degree == freezed
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: true)
class _$_Education implements _Education {
  const _$_Education(
      {required this.name,
      required this.specialty,
      required this.degree,
      this.dateStart,
      this.dateEnd});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$_$_EducationFromJson(json);

  @override
  final String name;
  @override
  final String specialty;
  @override
  final String degree;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;

  @override
  String toString() {
    return 'Education(name: $name, specialty: $specialty, degree: $degree, dateStart: $dateStart, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Education &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.specialty, specialty) ||
                const DeepCollectionEquality()
                    .equals(other.specialty, specialty)) &&
            (identical(other.degree, degree) ||
                const DeepCollectionEquality().equals(other.degree, degree)) &&
            (identical(other.dateStart, dateStart) ||
                const DeepCollectionEquality()
                    .equals(other.dateStart, dateStart)) &&
            (identical(other.dateEnd, dateEnd) ||
                const DeepCollectionEquality().equals(other.dateEnd, dateEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(specialty) ^
      const DeepCollectionEquality().hash(degree) ^
      const DeepCollectionEquality().hash(dateStart) ^
      const DeepCollectionEquality().hash(dateEnd);

  @JsonKey(ignore: true)
  @override
  _$EducationCopyWith<_Education> get copyWith =>
      __$EducationCopyWithImpl<_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EducationToJson(this);
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {required String name,
      required String specialty,
      required String degree,
      DateTime? dateStart,
      DateTime? dateEnd}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get specialty => throw _privateConstructorUsedError;
  @override
  String get degree => throw _privateConstructorUsedError;
  @override
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @override
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EducationCopyWith<_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
