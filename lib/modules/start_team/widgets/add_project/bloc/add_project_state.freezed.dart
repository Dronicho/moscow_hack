// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddProjectStateTearOff {
  const _$AddProjectStateTearOff();

  _AddProjectState call({required Project project, bool loading = false}) {
    return _AddProjectState(
      project: project,
      loading: loading,
    );
  }
}

/// @nodoc
const $AddProjectState = _$AddProjectStateTearOff();

/// @nodoc
mixin _$AddProjectState {
  Project get project => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProjectStateCopyWith<AddProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProjectStateCopyWith<$Res> {
  factory $AddProjectStateCopyWith(
          AddProjectState value, $Res Function(AddProjectState) then) =
      _$AddProjectStateCopyWithImpl<$Res>;
  $Res call({Project project, bool loading});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$AddProjectStateCopyWithImpl<$Res>
    implements $AddProjectStateCopyWith<$Res> {
  _$AddProjectStateCopyWithImpl(this._value, this._then);

  final AddProjectState _value;
  // ignore: unused_field
  final $Res Function(AddProjectState) _then;

  @override
  $Res call({
    Object? project = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc
abstract class _$AddProjectStateCopyWith<$Res>
    implements $AddProjectStateCopyWith<$Res> {
  factory _$AddProjectStateCopyWith(
          _AddProjectState value, $Res Function(_AddProjectState) then) =
      __$AddProjectStateCopyWithImpl<$Res>;
  @override
  $Res call({Project project, bool loading});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$AddProjectStateCopyWithImpl<$Res>
    extends _$AddProjectStateCopyWithImpl<$Res>
    implements _$AddProjectStateCopyWith<$Res> {
  __$AddProjectStateCopyWithImpl(
      _AddProjectState _value, $Res Function(_AddProjectState) _then)
      : super(_value, (v) => _then(v as _AddProjectState));

  @override
  _AddProjectState get _value => super._value as _AddProjectState;

  @override
  $Res call({
    Object? project = freezed,
    Object? loading = freezed,
  }) {
    return _then(_AddProjectState(
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddProjectState implements _AddProjectState {
  _$_AddProjectState({required this.project, this.loading = false});

  @override
  final Project project;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;

  @override
  String toString() {
    return 'AddProjectState(project: $project, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddProjectState &&
            (identical(other.project, project) ||
                const DeepCollectionEquality()
                    .equals(other.project, project)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(project) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$AddProjectStateCopyWith<_AddProjectState> get copyWith =>
      __$AddProjectStateCopyWithImpl<_AddProjectState>(this, _$identity);
}

abstract class _AddProjectState implements AddProjectState {
  factory _AddProjectState({required Project project, bool loading}) =
      _$_AddProjectState;

  @override
  Project get project => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddProjectStateCopyWith<_AddProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
