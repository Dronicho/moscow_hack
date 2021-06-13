import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

class SendingAttachment {
  bool sent;
  // TODO: fix it
  // DeviceImage image;
  // LocalImage localImage;
  String? url;

  SendingAttachment()
      : sent = false,
        url = null;
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    //The attachment type based on the URL resource. This can be: audio, image or video
    required  String type,

    ///The link to which the attachment message points to.
     String? titleLink,

    /// The attachment title
     String? title,

    /// The URL to the attached file thumbnail. You can use this to represent the attached link.
     String? thumbUrl,

    /// The attachment text. It will be displayed in the channel next to the original message.
     String? text,

    /// Optional text that appears above the attachment block
     String? pretext,

    /// The original URL that was used to scrape this attachment.
     String? ogScrapeUrl,

    /// The URL to the attached image. This is present for URL pointing to an image article (eg. Unsplash)
    required  String imageUrl,
     String? footerIcon,
     String? footer,
     String? fallback,
     String? color,
     String? assetUrl,
     double? width,
     double? height,
     Uri? localUri,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);



}
