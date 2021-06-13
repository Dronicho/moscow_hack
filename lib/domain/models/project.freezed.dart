// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
class _$ProjectTearOff {
  const _$ProjectTearOff();

  _Project call(
      {String? id,
      required String name,
      String? photoURL,
      required String area,
      required String description,
      @JsonKey(name: 'uniqueAdvantage') required String advantage,
      @JsonKey(name: 'readyStage') required String stage,
      required String intellectualProperty,
      List<String>? additionalMaterials,
      required String needs,
      required String marketApplication,
      required String competitors,
      required DateTime dateStart,
      List<String>? skills,
      @JsonKey(name: 'teamIDs') List<String>? teamIds,
      @JsonKey(name: 'requestedIds') List<String>? requestedIds,
      @JsonKey(name: 'teamCapitan') String? leaderId,
      @JsonKey(ignore: true) User? owner = null,
      @JsonKey(ignore: true) List<User>? members = null,
      @JsonKey(ignore: true) List<User>? applicants = null,
      @JsonKey(ignore: true) bool isOwner = false,
      @JsonKey(ignore: true) bool isMember = false,
      @JsonKey(ignore: true) dynamic state = ProjectState.none,
      @JsonKey(name: 'leadershipExperience') required String experience,
      @JsonKey(name: 'resourcesAndInfrastructure') required String resources,
      @JsonKey(name: 'currentProjectStatus') required String status,
      @JsonKey(name: 'implementationModel') required String model,
      @JsonKey(name: 'developmentPlan') required String plan}) {
    return _Project(
      id: id,
      name: name,
      photoURL: photoURL,
      area: area,
      description: description,
      advantage: advantage,
      stage: stage,
      intellectualProperty: intellectualProperty,
      additionalMaterials: additionalMaterials,
      needs: needs,
      marketApplication: marketApplication,
      competitors: competitors,
      dateStart: dateStart,
      skills: skills,
      teamIds: teamIds,
      requestedIds: requestedIds,
      leaderId: leaderId,
      owner: owner,
      members: members,
      applicants: applicants,
      isOwner: isOwner,
      isMember: isMember,
      state: state,
      experience: experience,
      resources: resources,
      status: status,
      model: model,
      plan: plan,
    );
  }

  Project fromJson(Map<String, Object> json) {
    return Project.fromJson(json);
  }
}

/// @nodoc
const $Project = _$ProjectTearOff();

/// @nodoc
mixin _$Project {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniqueAdvantage')
  String get advantage => throw _privateConstructorUsedError;
  @JsonKey(name: 'readyStage')
  String get stage => throw _privateConstructorUsedError;
  String get intellectualProperty => throw _privateConstructorUsedError;
  List<String>? get additionalMaterials => throw _privateConstructorUsedError;
  String get needs => throw _privateConstructorUsedError;
  String get marketApplication => throw _privateConstructorUsedError;
  String get competitors => throw _privateConstructorUsedError;
  DateTime get dateStart => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamIDs')
  List<String>? get teamIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestedIds')
  List<String>? get requestedIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamCapitan')
  String? get leaderId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  User? get owner => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<User>? get members => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<User>? get applicants => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isOwner => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isMember => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  dynamic get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'leadershipExperience')
  String get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'resourcesAndInfrastructure')
  String get resources => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentProjectStatus')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'implementationModel')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'developmentPlan')
  String get plan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String? photoURL,
      String area,
      String description,
      @JsonKey(name: 'uniqueAdvantage') String advantage,
      @JsonKey(name: 'readyStage') String stage,
      String intellectualProperty,
      List<String>? additionalMaterials,
      String needs,
      String marketApplication,
      String competitors,
      DateTime dateStart,
      List<String>? skills,
      @JsonKey(name: 'teamIDs') List<String>? teamIds,
      @JsonKey(name: 'requestedIds') List<String>? requestedIds,
      @JsonKey(name: 'teamCapitan') String? leaderId,
      @JsonKey(ignore: true) User? owner,
      @JsonKey(ignore: true) List<User>? members,
      @JsonKey(ignore: true) List<User>? applicants,
      @JsonKey(ignore: true) bool isOwner,
      @JsonKey(ignore: true) bool isMember,
      @JsonKey(ignore: true) dynamic state,
      @JsonKey(name: 'leadershipExperience') String experience,
      @JsonKey(name: 'resourcesAndInfrastructure') String resources,
      @JsonKey(name: 'currentProjectStatus') String status,
      @JsonKey(name: 'implementationModel') String model,
      @JsonKey(name: 'developmentPlan') String plan});

  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoURL = freezed,
    Object? area = freezed,
    Object? description = freezed,
    Object? advantage = freezed,
    Object? stage = freezed,
    Object? intellectualProperty = freezed,
    Object? additionalMaterials = freezed,
    Object? needs = freezed,
    Object? marketApplication = freezed,
    Object? competitors = freezed,
    Object? dateStart = freezed,
    Object? skills = freezed,
    Object? teamIds = freezed,
    Object? requestedIds = freezed,
    Object? leaderId = freezed,
    Object? owner = freezed,
    Object? members = freezed,
    Object? applicants = freezed,
    Object? isOwner = freezed,
    Object? isMember = freezed,
    Object? state = freezed,
    Object? experience = freezed,
    Object? resources = freezed,
    Object? status = freezed,
    Object? model = freezed,
    Object? plan = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      advantage: advantage == freezed
          ? _value.advantage
          : advantage // ignore: cast_nullable_to_non_nullable
              as String,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      intellectualProperty: intellectualProperty == freezed
          ? _value.intellectualProperty
          : intellectualProperty // ignore: cast_nullable_to_non_nullable
              as String,
      additionalMaterials: additionalMaterials == freezed
          ? _value.additionalMaterials
          : additionalMaterials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      needs: needs == freezed
          ? _value.needs
          : needs // ignore: cast_nullable_to_non_nullable
              as String,
      marketApplication: marketApplication == freezed
          ? _value.marketApplication
          : marketApplication // ignore: cast_nullable_to_non_nullable
              as String,
      competitors: competitors == freezed
          ? _value.competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      teamIds: teamIds == freezed
          ? _value.teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requestedIds: requestedIds == freezed
          ? _value.requestedIds
          : requestedIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      leaderId: leaderId == freezed
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      applicants: applicants == freezed
          ? _value.applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isMember: isMember == freezed
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      experience: experience == freezed
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String? photoURL,
      String area,
      String description,
      @JsonKey(name: 'uniqueAdvantage') String advantage,
      @JsonKey(name: 'readyStage') String stage,
      String intellectualProperty,
      List<String>? additionalMaterials,
      String needs,
      String marketApplication,
      String competitors,
      DateTime dateStart,
      List<String>? skills,
      @JsonKey(name: 'teamIDs') List<String>? teamIds,
      @JsonKey(name: 'requestedIds') List<String>? requestedIds,
      @JsonKey(name: 'teamCapitan') String? leaderId,
      @JsonKey(ignore: true) User? owner,
      @JsonKey(ignore: true) List<User>? members,
      @JsonKey(ignore: true) List<User>? applicants,
      @JsonKey(ignore: true) bool isOwner,
      @JsonKey(ignore: true) bool isMember,
      @JsonKey(ignore: true) dynamic state,
      @JsonKey(name: 'leadershipExperience') String experience,
      @JsonKey(name: 'resourcesAndInfrastructure') String resources,
      @JsonKey(name: 'currentProjectStatus') String status,
      @JsonKey(name: 'implementationModel') String model,
      @JsonKey(name: 'developmentPlan') String plan});

  @override
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(_Project _value, $Res Function(_Project) _then)
      : super(_value, (v) => _then(v as _Project));

  @override
  _Project get _value => super._value as _Project;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoURL = freezed,
    Object? area = freezed,
    Object? description = freezed,
    Object? advantage = freezed,
    Object? stage = freezed,
    Object? intellectualProperty = freezed,
    Object? additionalMaterials = freezed,
    Object? needs = freezed,
    Object? marketApplication = freezed,
    Object? competitors = freezed,
    Object? dateStart = freezed,
    Object? skills = freezed,
    Object? teamIds = freezed,
    Object? requestedIds = freezed,
    Object? leaderId = freezed,
    Object? owner = freezed,
    Object? members = freezed,
    Object? applicants = freezed,
    Object? isOwner = freezed,
    Object? isMember = freezed,
    Object? state = freezed,
    Object? experience = freezed,
    Object? resources = freezed,
    Object? status = freezed,
    Object? model = freezed,
    Object? plan = freezed,
  }) {
    return _then(_Project(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      advantage: advantage == freezed
          ? _value.advantage
          : advantage // ignore: cast_nullable_to_non_nullable
              as String,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      intellectualProperty: intellectualProperty == freezed
          ? _value.intellectualProperty
          : intellectualProperty // ignore: cast_nullable_to_non_nullable
              as String,
      additionalMaterials: additionalMaterials == freezed
          ? _value.additionalMaterials
          : additionalMaterials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      needs: needs == freezed
          ? _value.needs
          : needs // ignore: cast_nullable_to_non_nullable
              as String,
      marketApplication: marketApplication == freezed
          ? _value.marketApplication
          : marketApplication // ignore: cast_nullable_to_non_nullable
              as String,
      competitors: competitors == freezed
          ? _value.competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      teamIds: teamIds == freezed
          ? _value.teamIds
          : teamIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requestedIds: requestedIds == freezed
          ? _value.requestedIds
          : requestedIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      leaderId: leaderId == freezed
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      applicants: applicants == freezed
          ? _value.applicants
          : applicants // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      isOwner: isOwner == freezed
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isMember: isMember == freezed
          ? _value.isMember
          : isMember // ignore: cast_nullable_to_non_nullable
              as bool,
      state: state == freezed ? _value.state : state,
      experience: experience == freezed
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  _$_Project(
      {this.id,
      required this.name,
      this.photoURL,
      required this.area,
      required this.description,
      @JsonKey(name: 'uniqueAdvantage') required this.advantage,
      @JsonKey(name: 'readyStage') required this.stage,
      required this.intellectualProperty,
      this.additionalMaterials,
      required this.needs,
      required this.marketApplication,
      required this.competitors,
      required this.dateStart,
      this.skills,
      @JsonKey(name: 'teamIDs') this.teamIds,
      @JsonKey(name: 'requestedIds') this.requestedIds,
      @JsonKey(name: 'teamCapitan') this.leaderId,
      @JsonKey(ignore: true) this.owner = null,
      @JsonKey(ignore: true) this.members = null,
      @JsonKey(ignore: true) this.applicants = null,
      @JsonKey(ignore: true) this.isOwner = false,
      @JsonKey(ignore: true) this.isMember = false,
      @JsonKey(ignore: true) this.state = ProjectState.none,
      @JsonKey(name: 'leadershipExperience') required this.experience,
      @JsonKey(name: 'resourcesAndInfrastructure') required this.resources,
      @JsonKey(name: 'currentProjectStatus') required this.status,
      @JsonKey(name: 'implementationModel') required this.model,
      @JsonKey(name: 'developmentPlan') required this.plan});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$_$_ProjectFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? photoURL;
  @override
  final String area;
  @override
  final String description;
  @override
  @JsonKey(name: 'uniqueAdvantage')
  final String advantage;
  @override
  @JsonKey(name: 'readyStage')
  final String stage;
  @override
  final String intellectualProperty;
  @override
  final List<String>? additionalMaterials;
  @override
  final String needs;
  @override
  final String marketApplication;
  @override
  final String competitors;
  @override
  final DateTime dateStart;
  @override
  final List<String>? skills;
  @override
  @JsonKey(name: 'teamIDs')
  final List<String>? teamIds;
  @override
  @JsonKey(name: 'requestedIds')
  final List<String>? requestedIds;
  @override
  @JsonKey(name: 'teamCapitan')
  final String? leaderId;
  @override
  @JsonKey(ignore: true)
  final User? owner;
  @override
  @JsonKey(ignore: true)
  final List<User>? members;
  @override
  @JsonKey(ignore: true)
  final List<User>? applicants;
  @override
  @JsonKey(ignore: true)
  final bool isOwner;
  @override
  @JsonKey(ignore: true)
  final bool isMember;
  @override
  @JsonKey(ignore: true)
  final dynamic state;
  @override
  @JsonKey(name: 'leadershipExperience')
  final String experience;
  @override
  @JsonKey(name: 'resourcesAndInfrastructure')
  final String resources;
  @override
  @JsonKey(name: 'currentProjectStatus')
  final String status;
  @override
  @JsonKey(name: 'implementationModel')
  final String model;
  @override
  @JsonKey(name: 'developmentPlan')
  final String plan;

  @override
  String toString() {
    return 'Project(id: $id, name: $name, photoURL: $photoURL, area: $area, description: $description, advantage: $advantage, stage: $stage, intellectualProperty: $intellectualProperty, additionalMaterials: $additionalMaterials, needs: $needs, marketApplication: $marketApplication, competitors: $competitors, dateStart: $dateStart, skills: $skills, teamIds: $teamIds, requestedIds: $requestedIds, leaderId: $leaderId, owner: $owner, members: $members, applicants: $applicants, isOwner: $isOwner, isMember: $isMember, state: $state, experience: $experience, resources: $resources, status: $status, model: $model, plan: $plan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Project &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.advantage, advantage) ||
                const DeepCollectionEquality()
                    .equals(other.advantage, advantage)) &&
            (identical(other.stage, stage) ||
                const DeepCollectionEquality().equals(other.stage, stage)) &&
            (identical(other.intellectualProperty, intellectualProperty) ||
                const DeepCollectionEquality().equals(
                    other.intellectualProperty, intellectualProperty)) &&
            (identical(other.additionalMaterials, additionalMaterials) ||
                const DeepCollectionEquality()
                    .equals(other.additionalMaterials, additionalMaterials)) &&
            (identical(other.needs, needs) ||
                const DeepCollectionEquality().equals(other.needs, needs)) &&
            (identical(other.marketApplication, marketApplication) ||
                const DeepCollectionEquality()
                    .equals(other.marketApplication, marketApplication)) &&
            (identical(other.competitors, competitors) ||
                const DeepCollectionEquality()
                    .equals(other.competitors, competitors)) &&
            (identical(other.dateStart, dateStart) ||
                const DeepCollectionEquality()
                    .equals(other.dateStart, dateStart)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)) &&
            (identical(other.teamIds, teamIds) ||
                const DeepCollectionEquality()
                    .equals(other.teamIds, teamIds)) &&
            (identical(other.requestedIds, requestedIds) ||
                const DeepCollectionEquality()
                    .equals(other.requestedIds, requestedIds)) &&
            (identical(other.leaderId, leaderId) ||
                const DeepCollectionEquality()
                    .equals(other.leaderId, leaderId)) &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.applicants, applicants) ||
                const DeepCollectionEquality()
                    .equals(other.applicants, applicants)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality()
                    .equals(other.isOwner, isOwner)) &&
            (identical(other.isMember, isMember) ||
                const DeepCollectionEquality()
                    .equals(other.isMember, isMember)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.experience, experience) ||
                const DeepCollectionEquality()
                    .equals(other.experience, experience)) &&
            (identical(other.resources, resources) ||
                const DeepCollectionEquality()
                    .equals(other.resources, resources)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.model, model) || const DeepCollectionEquality().equals(other.model, model)) &&
            (identical(other.plan, plan) || const DeepCollectionEquality().equals(other.plan, plan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoURL) ^
      const DeepCollectionEquality().hash(area) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(advantage) ^
      const DeepCollectionEquality().hash(stage) ^
      const DeepCollectionEquality().hash(intellectualProperty) ^
      const DeepCollectionEquality().hash(additionalMaterials) ^
      const DeepCollectionEquality().hash(needs) ^
      const DeepCollectionEquality().hash(marketApplication) ^
      const DeepCollectionEquality().hash(competitors) ^
      const DeepCollectionEquality().hash(dateStart) ^
      const DeepCollectionEquality().hash(skills) ^
      const DeepCollectionEquality().hash(teamIds) ^
      const DeepCollectionEquality().hash(requestedIds) ^
      const DeepCollectionEquality().hash(leaderId) ^
      const DeepCollectionEquality().hash(owner) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(applicants) ^
      const DeepCollectionEquality().hash(isOwner) ^
      const DeepCollectionEquality().hash(isMember) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(experience) ^
      const DeepCollectionEquality().hash(resources) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(model) ^
      const DeepCollectionEquality().hash(plan);

  @JsonKey(ignore: true)
  @override
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProjectToJson(this);
  }
}

abstract class _Project implements Project {
  factory _Project(
      {String? id,
      required String name,
      String? photoURL,
      required String area,
      required String description,
      @JsonKey(name: 'uniqueAdvantage') required String advantage,
      @JsonKey(name: 'readyStage') required String stage,
      required String intellectualProperty,
      List<String>? additionalMaterials,
      required String needs,
      required String marketApplication,
      required String competitors,
      required DateTime dateStart,
      List<String>? skills,
      @JsonKey(name: 'teamIDs') List<String>? teamIds,
      @JsonKey(name: 'requestedIds') List<String>? requestedIds,
      @JsonKey(name: 'teamCapitan') String? leaderId,
      @JsonKey(ignore: true) User? owner,
      @JsonKey(ignore: true) List<User>? members,
      @JsonKey(ignore: true) List<User>? applicants,
      @JsonKey(ignore: true) bool isOwner,
      @JsonKey(ignore: true) bool isMember,
      @JsonKey(ignore: true) dynamic state,
      @JsonKey(name: 'leadershipExperience') required String experience,
      @JsonKey(name: 'resourcesAndInfrastructure') required String resources,
      @JsonKey(name: 'currentProjectStatus') required String status,
      @JsonKey(name: 'implementationModel') required String model,
      @JsonKey(name: 'developmentPlan') required String plan}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  String get area => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'uniqueAdvantage')
  String get advantage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'readyStage')
  String get stage => throw _privateConstructorUsedError;
  @override
  String get intellectualProperty => throw _privateConstructorUsedError;
  @override
  List<String>? get additionalMaterials => throw _privateConstructorUsedError;
  @override
  String get needs => throw _privateConstructorUsedError;
  @override
  String get marketApplication => throw _privateConstructorUsedError;
  @override
  String get competitors => throw _privateConstructorUsedError;
  @override
  DateTime get dateStart => throw _privateConstructorUsedError;
  @override
  List<String>? get skills => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'teamIDs')
  List<String>? get teamIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'requestedIds')
  List<String>? get requestedIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'teamCapitan')
  String? get leaderId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  User? get owner => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<User>? get members => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<User>? get applicants => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isOwner => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isMember => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  dynamic get state => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'leadershipExperience')
  String get experience => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'resourcesAndInfrastructure')
  String get resources => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'currentProjectStatus')
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'implementationModel')
  String get model => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'developmentPlan')
  String get plan => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProjectCopyWith<_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
