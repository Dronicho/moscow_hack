import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'attachment.dart';
import 'user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message{
  const factory Message({
    String? id,

    /// The text of this message
    required String content,

    /// The status of a sending message
    @Default(MessageSendingStatus.SENT)
    @JsonKey(ignore: true)
        MessageSendingStatus status,

    /// The message type
    String? type,

    /// The list of attachments, either provided by the user or generated from a command or as a result of URL scraping.
    List<Attachment>? attachments,

    /// If true the message is silent
    bool? silent,

    /// Reserved field indicating when the message was created.
    required DateTime createdAt,

    /// Reserved field indicating when the message was updated last time.
    DateTime? updatedAt,
    bool? read,

    /// User who sent the message
    @JsonKey(includeIfNull: false) required User user,
  }) = _Message;

  // /// True if the message is a system info
  // bool get isSystem => type == 'system';

  // /// True if the message has been deleted
  // bool get isDeleted => type == 'deleted';

  // /// True if the message is ephemeral
  // bool get isEphemeral => type == 'ephemeral';

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

/// Enum defining the status of a sending message
enum MessageSendingStatus {
  /// Message is being sent
  SENDING,

  /// Message is being updated
  UPDATING,

  /// Message is being deleted
  DELETING,

  /// Message failed to send
  FAILED,

  /// Message failed to updated
  FAILED_UPDATE,

  /// Message failed to delete
  FAILED_DELETE,

  /// Message correctly sent
  SENT,
}
