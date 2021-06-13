// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {String? id,
      required String content,
      @JsonKey(ignore: true)
          MessageSendingStatus status = MessageSendingStatus.SENT,
      String? type,
      List<Attachment>? attachments,
      bool? silent,
      required DateTime createdAt,
      DateTime? updatedAt,
      bool? read,
      @JsonKey(includeIfNull: false)
          required User user}) {
    return _Message(
      id: id,
      content: content,
      status: status,
      type: type,
      attachments: attachments,
      silent: silent,
      createdAt: createdAt,
      updatedAt: updatedAt,
      read: read,
      user: user,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String? get id => throw _privateConstructorUsedError;

  /// The text of this message
  String get content => throw _privateConstructorUsedError;

  /// The status of a sending message
  @JsonKey(ignore: true)
  MessageSendingStatus get status => throw _privateConstructorUsedError;

  /// The message type
  String? get type => throw _privateConstructorUsedError;

  /// The list of attachments, either provided by the user or generated from a command or as a result of URL scraping.
  List<Attachment>? get attachments => throw _privateConstructorUsedError;

  /// If true the message is silent
  bool? get silent => throw _privateConstructorUsedError;

  /// Reserved field indicating when the message was created.
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Reserved field indicating when the message was updated last time.
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;

  /// User who sent the message
  @JsonKey(includeIfNull: false)
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String content,
      @JsonKey(ignore: true) MessageSendingStatus status,
      String? type,
      List<Attachment>? attachments,
      bool? silent,
      DateTime createdAt,
      DateTime? updatedAt,
      bool? read,
      @JsonKey(includeIfNull: false) User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? attachments = freezed,
    Object? silent = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageSendingStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      silent: silent == freezed
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String content,
      @JsonKey(ignore: true) MessageSendingStatus status,
      String? type,
      List<Attachment>? attachments,
      bool? silent,
      DateTime createdAt,
      DateTime? updatedAt,
      bool? read,
      @JsonKey(includeIfNull: false) User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? attachments = freezed,
    Object? silent = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? user = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageSendingStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      silent: silent == freezed
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {this.id,
      required this.content,
      @JsonKey(ignore: true) this.status = MessageSendingStatus.SENT,
      this.type,
      this.attachments,
      this.silent,
      required this.createdAt,
      this.updatedAt,
      this.read,
      @JsonKey(includeIfNull: false) required this.user});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageFromJson(json);

  @override
  final String? id;
  @override

  /// The text of this message
  final String content;
  @override

  /// The status of a sending message
  @JsonKey(ignore: true)
  final MessageSendingStatus status;
  @override

  /// The message type
  final String? type;
  @override

  /// The list of attachments, either provided by the user or generated from a command or as a result of URL scraping.
  final List<Attachment>? attachments;
  @override

  /// If true the message is silent
  final bool? silent;
  @override

  /// Reserved field indicating when the message was created.
  final DateTime createdAt;
  @override

  /// Reserved field indicating when the message was updated last time.
  final DateTime? updatedAt;
  @override
  final bool? read;
  @override

  /// User who sent the message
  @JsonKey(includeIfNull: false)
  final User user;

  @override
  String toString() {
    return 'Message(id: $id, content: $content, status: $status, type: $type, attachments: $attachments, silent: $silent, createdAt: $createdAt, updatedAt: $updatedAt, read: $read, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.silent, silent) ||
                const DeepCollectionEquality().equals(other.silent, silent)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(silent) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {String? id,
      required String content,
      @JsonKey(ignore: true) MessageSendingStatus status,
      String? type,
      List<Attachment>? attachments,
      bool? silent,
      required DateTime createdAt,
      DateTime? updatedAt,
      bool? read,
      @JsonKey(includeIfNull: false) required User user}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override

  /// The text of this message
  String get content => throw _privateConstructorUsedError;
  @override

  /// The status of a sending message
  @JsonKey(ignore: true)
  MessageSendingStatus get status => throw _privateConstructorUsedError;
  @override

  /// The message type
  String? get type => throw _privateConstructorUsedError;
  @override

  /// The list of attachments, either provided by the user or generated from a command or as a result of URL scraping.
  List<Attachment>? get attachments => throw _privateConstructorUsedError;
  @override

  /// If true the message is silent
  bool? get silent => throw _privateConstructorUsedError;
  @override

  /// Reserved field indicating when the message was created.
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override

  /// Reserved field indicating when the message was updated last time.
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  bool? get read => throw _privateConstructorUsedError;
  @override

  /// User who sent the message
  @JsonKey(includeIfNull: false)
  User get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
