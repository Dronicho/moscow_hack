// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attachment _$_$_AttachmentFromJson(Map<String, dynamic> json) {
  return _$_Attachment(
    type: json['type'] as String,
    titleLink: json['titleLink'] as String?,
    title: json['title'] as String?,
    thumbUrl: json['thumbUrl'] as String?,
    text: json['text'] as String?,
    pretext: json['pretext'] as String?,
    ogScrapeUrl: json['ogScrapeUrl'] as String?,
    imageUrl: json['imageUrl'] as String,
    footerIcon: json['footerIcon'] as String?,
    footer: json['footer'] as String?,
    fallback: json['fallback'] as String?,
    color: json['color'] as String?,
    assetUrl: json['assetUrl'] as String?,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    localUri:
        json['localUri'] == null ? null : Uri.parse(json['localUri'] as String),
  );
}

Map<String, dynamic> _$_$_AttachmentToJson(_$_Attachment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'titleLink': instance.titleLink,
      'title': instance.title,
      'thumbUrl': instance.thumbUrl,
      'text': instance.text,
      'pretext': instance.pretext,
      'ogScrapeUrl': instance.ogScrapeUrl,
      'imageUrl': instance.imageUrl,
      'footerIcon': instance.footerIcon,
      'footer': instance.footer,
      'fallback': instance.fallback,
      'color': instance.color,
      'assetUrl': instance.assetUrl,
      'width': instance.width,
      'height': instance.height,
      'localUri': instance.localUri?.toString(),
    };
