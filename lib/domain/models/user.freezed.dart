// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      required String fio,
      required String email,
      required List<String> skills,
      required UserStats stats,
      List<String>? requestedProjects,
      DateTime? createdAt,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      @JsonKey(ignore: true) SendingAttachment? localImage,
      @JsonKey(ignore: true) List<String> outgoingProjects = const [],
      @JsonKey(name: 'workExperience') List<WorkExperience?>? work,
      List<Education?>? education}) {
    return _User(
      id: id,
      fio: fio,
      email: email,
      skills: skills,
      stats: stats,
      requestedProjects: requestedProjects,
      createdAt: createdAt,
      photoUrl: photoUrl,
      about: about,
      phone: phone,
      socials: socials,
      snils: snils,
      localImage: localImage,
      outgoingProjects: outgoingProjects,
      work: work,
      education: education,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get fio => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  UserStats get stats => throw _privateConstructorUsedError;
  List<String>? get requestedProjects => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get socials => throw _privateConstructorUsedError;
  @JsonKey(name: 'SNILS')
  String? get snils => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  SendingAttachment? get localImage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<String> get outgoingProjects => throw _privateConstructorUsedError;
  @JsonKey(name: 'workExperience')
  List<WorkExperience?>? get work => throw _privateConstructorUsedError;
  List<Education?>? get education => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String fio,
      String email,
      List<String> skills,
      UserStats stats,
      List<String>? requestedProjects,
      DateTime? createdAt,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      @JsonKey(ignore: true) SendingAttachment? localImage,
      @JsonKey(ignore: true) List<String> outgoingProjects,
      @JsonKey(name: 'workExperience') List<WorkExperience?>? work,
      List<Education?>? education});

  $UserStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? fio = freezed,
    Object? email = freezed,
    Object? skills = freezed,
    Object? stats = freezed,
    Object? requestedProjects = freezed,
    Object? createdAt = freezed,
    Object? photoUrl = freezed,
    Object? about = freezed,
    Object? phone = freezed,
    Object? socials = freezed,
    Object? snils = freezed,
    Object? localImage = freezed,
    Object? outgoingProjects = freezed,
    Object? work = freezed,
    Object? education = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fio: fio == freezed
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats,
      requestedProjects: requestedProjects == freezed
          ? _value.requestedProjects
          : requestedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      socials: socials == freezed
          ? _value.socials
          : socials // ignore: cast_nullable_to_non_nullable
              as String?,
      snils: snils == freezed
          ? _value.snils
          : snils // ignore: cast_nullable_to_non_nullable
              as String?,
      localImage: localImage == freezed
          ? _value.localImage
          : localImage // ignore: cast_nullable_to_non_nullable
              as SendingAttachment?,
      outgoingProjects: outgoingProjects == freezed
          ? _value.outgoingProjects
          : outgoingProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as List<WorkExperience?>?,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education?>?,
    ));
  }

  @override
  $UserStatsCopyWith<$Res> get stats {
    return $UserStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String fio,
      String email,
      List<String> skills,
      UserStats stats,
      List<String>? requestedProjects,
      DateTime? createdAt,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      @JsonKey(ignore: true) SendingAttachment? localImage,
      @JsonKey(ignore: true) List<String> outgoingProjects,
      @JsonKey(name: 'workExperience') List<WorkExperience?>? work,
      List<Education?>? education});

  @override
  $UserStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? fio = freezed,
    Object? email = freezed,
    Object? skills = freezed,
    Object? stats = freezed,
    Object? requestedProjects = freezed,
    Object? createdAt = freezed,
    Object? photoUrl = freezed,
    Object? about = freezed,
    Object? phone = freezed,
    Object? socials = freezed,
    Object? snils = freezed,
    Object? localImage = freezed,
    Object? outgoingProjects = freezed,
    Object? work = freezed,
    Object? education = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fio: fio == freezed
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserStats,
      requestedProjects: requestedProjects == freezed
          ? _value.requestedProjects
          : requestedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      socials: socials == freezed
          ? _value.socials
          : socials // ignore: cast_nullable_to_non_nullable
              as String?,
      snils: snils == freezed
          ? _value.snils
          : snils // ignore: cast_nullable_to_non_nullable
              as String?,
      localImage: localImage == freezed
          ? _value.localImage
          : localImage // ignore: cast_nullable_to_non_nullable
              as SendingAttachment?,
      outgoingProjects: outgoingProjects == freezed
          ? _value.outgoingProjects
          : outgoingProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      work: work == freezed
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as List<WorkExperience?>?,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: true)
class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.fio,
      required this.email,
      required this.skills,
      required this.stats,
      this.requestedProjects,
      this.createdAt,
      @JsonKey(name: 'photoURL') this.photoUrl,
      this.about,
      this.phone,
      this.socials,
      @JsonKey(name: 'SNILS') this.snils,
      @JsonKey(ignore: true) this.localImage,
      @JsonKey(ignore: true) this.outgoingProjects = const [],
      @JsonKey(name: 'workExperience') this.work,
      this.education})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String fio;
  @override
  final String email;
  @override
  final List<String> skills;
  @override
  final UserStats stats;
  @override
  final List<String>? requestedProjects;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'photoURL')
  final String? photoUrl;
  @override
  final String? about;
  @override
  final String? phone;
  @override
  final String? socials;
  @override
  @JsonKey(name: 'SNILS')
  final String? snils;
  @override
  @JsonKey(ignore: true)
  final SendingAttachment? localImage;
  @override
  @JsonKey(ignore: true)
  final List<String> outgoingProjects;
  @override
  @JsonKey(name: 'workExperience')
  final List<WorkExperience?>? work;
  @override
  final List<Education?>? education;

  @override
  String toString() {
    return 'User(id: $id, fio: $fio, email: $email, skills: $skills, stats: $stats, requestedProjects: $requestedProjects, createdAt: $createdAt, photoUrl: $photoUrl, about: $about, phone: $phone, socials: $socials, snils: $snils, localImage: $localImage, outgoingProjects: $outgoingProjects, work: $work, education: $education)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fio, fio) ||
                const DeepCollectionEquality().equals(other.fio, fio)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)) &&
            (identical(other.stats, stats) ||
                const DeepCollectionEquality().equals(other.stats, stats)) &&
            (identical(other.requestedProjects, requestedProjects) ||
                const DeepCollectionEquality()
                    .equals(other.requestedProjects, requestedProjects)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.socials, socials) ||
                const DeepCollectionEquality()
                    .equals(other.socials, socials)) &&
            (identical(other.snils, snils) ||
                const DeepCollectionEquality().equals(other.snils, snils)) &&
            (identical(other.localImage, localImage) ||
                const DeepCollectionEquality()
                    .equals(other.localImage, localImage)) &&
            (identical(other.outgoingProjects, outgoingProjects) ||
                const DeepCollectionEquality()
                    .equals(other.outgoingProjects, outgoingProjects)) &&
            (identical(other.work, work) ||
                const DeepCollectionEquality().equals(other.work, work)) &&
            (identical(other.education, education) ||
                const DeepCollectionEquality()
                    .equals(other.education, education)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fio) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(skills) ^
      const DeepCollectionEquality().hash(stats) ^
      const DeepCollectionEquality().hash(requestedProjects) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(socials) ^
      const DeepCollectionEquality().hash(snils) ^
      const DeepCollectionEquality().hash(localImage) ^
      const DeepCollectionEquality().hash(outgoingProjects) ^
      const DeepCollectionEquality().hash(work) ^
      const DeepCollectionEquality().hash(education);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User(
      {required String id,
      required String fio,
      required String email,
      required List<String> skills,
      required UserStats stats,
      List<String>? requestedProjects,
      DateTime? createdAt,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      @JsonKey(ignore: true) SendingAttachment? localImage,
      @JsonKey(ignore: true) List<String> outgoingProjects,
      @JsonKey(name: 'workExperience') List<WorkExperience?>? work,
      List<Education?>? education}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get fio => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  List<String> get skills => throw _privateConstructorUsedError;
  @override
  UserStats get stats => throw _privateConstructorUsedError;
  @override
  List<String>? get requestedProjects => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photoURL')
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get socials => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'SNILS')
  String? get snils => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  SendingAttachment? get localImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<String> get outgoingProjects => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'workExperience')
  List<WorkExperience?>? get work => throw _privateConstructorUsedError;
  @override
  List<Education?>? get education => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
class _$UserStatsTearOff {
  const _$UserStatsTearOff();

  _UserStats call(
      {required int friendly,
      required int competent,
      required int leadership}) {
    return _UserStats(
      friendly: friendly,
      competent: competent,
      leadership: leadership,
    );
  }

  UserStats fromJson(Map<String, Object> json) {
    return UserStats.fromJson(json);
  }
}

/// @nodoc
const $UserStats = _$UserStatsTearOff();

/// @nodoc
mixin _$UserStats {
  int get friendly => throw _privateConstructorUsedError;
  int get competent => throw _privateConstructorUsedError;
  int get leadership => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res>;
  $Res call({int friendly, int competent, int leadership});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res> implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  final UserStats _value;
  // ignore: unused_field
  final $Res Function(UserStats) _then;

  @override
  $Res call({
    Object? friendly = freezed,
    Object? competent = freezed,
    Object? leadership = freezed,
  }) {
    return _then(_value.copyWith(
      friendly: friendly == freezed
          ? _value.friendly
          : friendly // ignore: cast_nullable_to_non_nullable
              as int,
      competent: competent == freezed
          ? _value.competent
          : competent // ignore: cast_nullable_to_non_nullable
              as int,
      leadership: leadership == freezed
          ? _value.leadership
          : leadership // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserStatsCopyWith<$Res> implements $UserStatsCopyWith<$Res> {
  factory _$UserStatsCopyWith(
          _UserStats value, $Res Function(_UserStats) then) =
      __$UserStatsCopyWithImpl<$Res>;
  @override
  $Res call({int friendly, int competent, int leadership});
}

/// @nodoc
class __$UserStatsCopyWithImpl<$Res> extends _$UserStatsCopyWithImpl<$Res>
    implements _$UserStatsCopyWith<$Res> {
  __$UserStatsCopyWithImpl(_UserStats _value, $Res Function(_UserStats) _then)
      : super(_value, (v) => _then(v as _UserStats));

  @override
  _UserStats get _value => super._value as _UserStats;

  @override
  $Res call({
    Object? friendly = freezed,
    Object? competent = freezed,
    Object? leadership = freezed,
  }) {
    return _then(_UserStats(
      friendly: friendly == freezed
          ? _value.friendly
          : friendly // ignore: cast_nullable_to_non_nullable
              as int,
      competent: competent == freezed
          ? _value.competent
          : competent // ignore: cast_nullable_to_non_nullable
              as int,
      leadership: leadership == freezed
          ? _value.leadership
          : leadership // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStats implements _UserStats {
  const _$_UserStats(
      {required this.friendly,
      required this.competent,
      required this.leadership});

  factory _$_UserStats.fromJson(Map<String, dynamic> json) =>
      _$_$_UserStatsFromJson(json);

  @override
  final int friendly;
  @override
  final int competent;
  @override
  final int leadership;

  @override
  String toString() {
    return 'UserStats(friendly: $friendly, competent: $competent, leadership: $leadership)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStats &&
            (identical(other.friendly, friendly) ||
                const DeepCollectionEquality()
                    .equals(other.friendly, friendly)) &&
            (identical(other.competent, competent) ||
                const DeepCollectionEquality()
                    .equals(other.competent, competent)) &&
            (identical(other.leadership, leadership) ||
                const DeepCollectionEquality()
                    .equals(other.leadership, leadership)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(friendly) ^
      const DeepCollectionEquality().hash(competent) ^
      const DeepCollectionEquality().hash(leadership);

  @JsonKey(ignore: true)
  @override
  _$UserStatsCopyWith<_UserStats> get copyWith =>
      __$UserStatsCopyWithImpl<_UserStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserStatsToJson(this);
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
      {required int friendly,
      required int competent,
      required int leadership}) = _$_UserStats;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$_UserStats.fromJson;

  @override
  int get friendly => throw _privateConstructorUsedError;
  @override
  int get competent => throw _privateConstructorUsedError;
  @override
  int get leadership => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserStatsCopyWith<_UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}
