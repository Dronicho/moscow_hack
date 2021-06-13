// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
class _$RoomTearOff {
  const _$RoomTearOff();

  _Room call(
      {required int id,
      required User target,
      int unread = 0,
      DateTime? otherLastRead,
      Message? lastMessage}) {
    return _Room(
      id: id,
      target: target,
      unread: unread,
      otherLastRead: otherLastRead,
      lastMessage: lastMessage,
    );
  }

  Room fromJson(Map<String, Object> json) {
    return Room.fromJson(json);
  }
}

/// @nodoc
const $Room = _$RoomTearOff();

/// @nodoc
mixin _$Room {
  int get id => throw _privateConstructorUsedError;
  User get target => throw _privateConstructorUsedError;
  int get unread => throw _privateConstructorUsedError;
  DateTime? get otherLastRead => throw _privateConstructorUsedError;
  Message? get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User target,
      int unread,
      DateTime? otherLastRead,
      Message? lastMessage});

  $UserCopyWith<$Res> get target;
  $MessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res> implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  final Room _value;
  // ignore: unused_field
  final $Res Function(Room) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? target = freezed,
    Object? unread = freezed,
    Object? otherLastRead = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as User,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as int,
      otherLastRead: otherLastRead == freezed
          ? _value.otherLastRead
          : otherLastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }

  @override
  $UserCopyWith<$Res> get target {
    return $UserCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value));
    });
  }

  @override
  $MessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) then) =
      __$RoomCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User target,
      int unread,
      DateTime? otherLastRead,
      Message? lastMessage});

  @override
  $UserCopyWith<$Res> get target;
  @override
  $MessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$RoomCopyWithImpl<$Res> extends _$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(_Room _value, $Res Function(_Room) _then)
      : super(_value, (v) => _then(v as _Room));

  @override
  _Room get _value => super._value as _Room;

  @override
  $Res call({
    Object? id = freezed,
    Object? target = freezed,
    Object? unread = freezed,
    Object? otherLastRead = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_Room(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as User,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as int,
      otherLastRead: otherLastRead == freezed
          ? _value.otherLastRead
          : otherLastRead // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Room implements _Room {
  const _$_Room(
      {required this.id,
      required this.target,
      this.unread = 0,
      this.otherLastRead,
      this.lastMessage});

  factory _$_Room.fromJson(Map<String, dynamic> json) =>
      _$_$_RoomFromJson(json);

  @override
  final int id;
  @override
  final User target;
  @JsonKey(defaultValue: 0)
  @override
  final int unread;
  @override
  final DateTime? otherLastRead;
  @override
  final Message? lastMessage;

  @override
  String toString() {
    return 'Room(id: $id, target: $target, unread: $unread, otherLastRead: $otherLastRead, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Room &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.target, target) ||
                const DeepCollectionEquality().equals(other.target, target)) &&
            (identical(other.unread, unread) ||
                const DeepCollectionEquality().equals(other.unread, unread)) &&
            (identical(other.otherLastRead, otherLastRead) ||
                const DeepCollectionEquality()
                    .equals(other.otherLastRead, otherLastRead)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(target) ^
      const DeepCollectionEquality().hash(unread) ^
      const DeepCollectionEquality().hash(otherLastRead) ^
      const DeepCollectionEquality().hash(lastMessage);

  @JsonKey(ignore: true)
  @override
  _$RoomCopyWith<_Room> get copyWith =>
      __$RoomCopyWithImpl<_Room>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoomToJson(this);
  }
}

abstract class _Room implements Room {
  const factory _Room(
      {required int id,
      required User target,
      int unread,
      DateTime? otherLastRead,
      Message? lastMessage}) = _$_Room;

  factory _Room.fromJson(Map<String, dynamic> json) = _$_Room.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get target => throw _privateConstructorUsedError;
  @override
  int get unread => throw _privateConstructorUsedError;
  @override
  DateTime? get otherLastRead => throw _privateConstructorUsedError;
  @override
  Message? get lastMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoomCopyWith<_Room> get copyWith => throw _privateConstructorUsedError;
}
