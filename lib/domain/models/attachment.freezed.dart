// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
class _$AttachmentTearOff {
  const _$AttachmentTearOff();

  _Attachment call(
      {required String type,
      String? titleLink,
      String? title,
      String? thumbUrl,
      String? text,
      String? pretext,
      String? ogScrapeUrl,
      required String imageUrl,
      String? footerIcon,
      String? footer,
      String? fallback,
      String? color,
      String? assetUrl,
      double? width,
      double? height,
      Uri? localUri}) {
    return _Attachment(
      type: type,
      titleLink: titleLink,
      title: title,
      thumbUrl: thumbUrl,
      text: text,
      pretext: pretext,
      ogScrapeUrl: ogScrapeUrl,
      imageUrl: imageUrl,
      footerIcon: footerIcon,
      footer: footer,
      fallback: fallback,
      color: color,
      assetUrl: assetUrl,
      width: width,
      height: height,
      localUri: localUri,
    );
  }

  Attachment fromJson(Map<String, Object> json) {
    return Attachment.fromJson(json);
  }
}

/// @nodoc
const $Attachment = _$AttachmentTearOff();

/// @nodoc
mixin _$Attachment {
//The attachment type based on the URL resource. This can be: audio, image or video
  String get type => throw _privateConstructorUsedError;

  ///The link to which the attachment message points to.
  String? get titleLink => throw _privateConstructorUsedError;

  /// The attachment title
  String? get title => throw _privateConstructorUsedError;

  /// The URL to the attached file thumbnail. You can use this to represent the attached link.
  String? get thumbUrl => throw _privateConstructorUsedError;

  /// The attachment text. It will be displayed in the channel next to the original message.
  String? get text => throw _privateConstructorUsedError;

  /// Optional text that appears above the attachment block
  String? get pretext => throw _privateConstructorUsedError;

  /// The original URL that was used to scrape this attachment.
  String? get ogScrapeUrl => throw _privateConstructorUsedError;

  /// The URL to the attached image. This is present for URL pointing to an image article (eg. Unsplash)
  String get imageUrl => throw _privateConstructorUsedError;
  String? get footerIcon => throw _privateConstructorUsedError;
  String? get footer => throw _privateConstructorUsedError;
  String? get fallback => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get assetUrl => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  Uri? get localUri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String? titleLink,
      String? title,
      String? thumbUrl,
      String? text,
      String? pretext,
      String? ogScrapeUrl,
      String imageUrl,
      String? footerIcon,
      String? footer,
      String? fallback,
      String? color,
      String? assetUrl,
      double? width,
      double? height,
      Uri? localUri});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res> implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  final Attachment _value;
  // ignore: unused_field
  final $Res Function(Attachment) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? titleLink = freezed,
    Object? title = freezed,
    Object? thumbUrl = freezed,
    Object? text = freezed,
    Object? pretext = freezed,
    Object? ogScrapeUrl = freezed,
    Object? imageUrl = freezed,
    Object? footerIcon = freezed,
    Object? footer = freezed,
    Object? fallback = freezed,
    Object? color = freezed,
    Object? assetUrl = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? localUri = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      titleLink: titleLink == freezed
          ? _value.titleLink
          : titleLink // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pretext: pretext == freezed
          ? _value.pretext
          : pretext // ignore: cast_nullable_to_non_nullable
              as String?,
      ogScrapeUrl: ogScrapeUrl == freezed
          ? _value.ogScrapeUrl
          : ogScrapeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      footerIcon: footerIcon == freezed
          ? _value.footerIcon
          : footerIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      footer: footer == freezed
          ? _value.footer
          : footer // ignore: cast_nullable_to_non_nullable
              as String?,
      fallback: fallback == freezed
          ? _value.fallback
          : fallback // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      assetUrl: assetUrl == freezed
          ? _value.assetUrl
          : assetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      localUri: localUri == freezed
          ? _value.localUri
          : localUri // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc
abstract class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(
          _Attachment value, $Res Function(_Attachment) then) =
      __$AttachmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String? titleLink,
      String? title,
      String? thumbUrl,
      String? text,
      String? pretext,
      String? ogScrapeUrl,
      String imageUrl,
      String? footerIcon,
      String? footer,
      String? fallback,
      String? color,
      String? assetUrl,
      double? width,
      double? height,
      Uri? localUri});
}

/// @nodoc
class __$AttachmentCopyWithImpl<$Res> extends _$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(
      _Attachment _value, $Res Function(_Attachment) _then)
      : super(_value, (v) => _then(v as _Attachment));

  @override
  _Attachment get _value => super._value as _Attachment;

  @override
  $Res call({
    Object? type = freezed,
    Object? titleLink = freezed,
    Object? title = freezed,
    Object? thumbUrl = freezed,
    Object? text = freezed,
    Object? pretext = freezed,
    Object? ogScrapeUrl = freezed,
    Object? imageUrl = freezed,
    Object? footerIcon = freezed,
    Object? footer = freezed,
    Object? fallback = freezed,
    Object? color = freezed,
    Object? assetUrl = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? localUri = freezed,
  }) {
    return _then(_Attachment(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      titleLink: titleLink == freezed
          ? _value.titleLink
          : titleLink // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      pretext: pretext == freezed
          ? _value.pretext
          : pretext // ignore: cast_nullable_to_non_nullable
              as String?,
      ogScrapeUrl: ogScrapeUrl == freezed
          ? _value.ogScrapeUrl
          : ogScrapeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      footerIcon: footerIcon == freezed
          ? _value.footerIcon
          : footerIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      footer: footer == freezed
          ? _value.footer
          : footer // ignore: cast_nullable_to_non_nullable
              as String?,
      fallback: fallback == freezed
          ? _value.fallback
          : fallback // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      assetUrl: assetUrl == freezed
          ? _value.assetUrl
          : assetUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      localUri: localUri == freezed
          ? _value.localUri
          : localUri // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attachment implements _Attachment {
  const _$_Attachment(
      {required this.type,
      this.titleLink,
      this.title,
      this.thumbUrl,
      this.text,
      this.pretext,
      this.ogScrapeUrl,
      required this.imageUrl,
      this.footerIcon,
      this.footer,
      this.fallback,
      this.color,
      this.assetUrl,
      this.width,
      this.height,
      this.localUri});

  factory _$_Attachment.fromJson(Map<String, dynamic> json) =>
      _$_$_AttachmentFromJson(json);

  @override //The attachment type based on the URL resource. This can be: audio, image or video
  final String type;
  @override

  ///The link to which the attachment message points to.
  final String? titleLink;
  @override

  /// The attachment title
  final String? title;
  @override

  /// The URL to the attached file thumbnail. You can use this to represent the attached link.
  final String? thumbUrl;
  @override

  /// The attachment text. It will be displayed in the channel next to the original message.
  final String? text;
  @override

  /// Optional text that appears above the attachment block
  final String? pretext;
  @override

  /// The original URL that was used to scrape this attachment.
  final String? ogScrapeUrl;
  @override

  /// The URL to the attached image. This is present for URL pointing to an image article (eg. Unsplash)
  final String imageUrl;
  @override
  final String? footerIcon;
  @override
  final String? footer;
  @override
  final String? fallback;
  @override
  final String? color;
  @override
  final String? assetUrl;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final Uri? localUri;

  @override
  String toString() {
    return 'Attachment(type: $type, titleLink: $titleLink, title: $title, thumbUrl: $thumbUrl, text: $text, pretext: $pretext, ogScrapeUrl: $ogScrapeUrl, imageUrl: $imageUrl, footerIcon: $footerIcon, footer: $footer, fallback: $fallback, color: $color, assetUrl: $assetUrl, width: $width, height: $height, localUri: $localUri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Attachment &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.titleLink, titleLink) ||
                const DeepCollectionEquality()
                    .equals(other.titleLink, titleLink)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.thumbUrl, thumbUrl) ||
                const DeepCollectionEquality()
                    .equals(other.thumbUrl, thumbUrl)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.pretext, pretext) ||
                const DeepCollectionEquality()
                    .equals(other.pretext, pretext)) &&
            (identical(other.ogScrapeUrl, ogScrapeUrl) ||
                const DeepCollectionEquality()
                    .equals(other.ogScrapeUrl, ogScrapeUrl)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.footerIcon, footerIcon) ||
                const DeepCollectionEquality()
                    .equals(other.footerIcon, footerIcon)) &&
            (identical(other.footer, footer) ||
                const DeepCollectionEquality().equals(other.footer, footer)) &&
            (identical(other.fallback, fallback) ||
                const DeepCollectionEquality()
                    .equals(other.fallback, fallback)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.assetUrl, assetUrl) ||
                const DeepCollectionEquality()
                    .equals(other.assetUrl, assetUrl)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.localUri, localUri) ||
                const DeepCollectionEquality()
                    .equals(other.localUri, localUri)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(titleLink) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(thumbUrl) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(pretext) ^
      const DeepCollectionEquality().hash(ogScrapeUrl) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(footerIcon) ^
      const DeepCollectionEquality().hash(footer) ^
      const DeepCollectionEquality().hash(fallback) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(assetUrl) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(localUri);

  @JsonKey(ignore: true)
  @override
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AttachmentToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment(
      {required String type,
      String? titleLink,
      String? title,
      String? thumbUrl,
      String? text,
      String? pretext,
      String? ogScrapeUrl,
      required String imageUrl,
      String? footerIcon,
      String? footer,
      String? fallback,
      String? color,
      String? assetUrl,
      double? width,
      double? height,
      Uri? localUri}) = _$_Attachment;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$_Attachment.fromJson;

  @override //The attachment type based on the URL resource. This can be: audio, image or video
  String get type => throw _privateConstructorUsedError;
  @override

  ///The link to which the attachment message points to.
  String? get titleLink => throw _privateConstructorUsedError;
  @override

  /// The attachment title
  String? get title => throw _privateConstructorUsedError;
  @override

  /// The URL to the attached file thumbnail. You can use this to represent the attached link.
  String? get thumbUrl => throw _privateConstructorUsedError;
  @override

  /// The attachment text. It will be displayed in the channel next to the original message.
  String? get text => throw _privateConstructorUsedError;
  @override

  /// Optional text that appears above the attachment block
  String? get pretext => throw _privateConstructorUsedError;
  @override

  /// The original URL that was used to scrape this attachment.
  String? get ogScrapeUrl => throw _privateConstructorUsedError;
  @override

  /// The URL to the attached image. This is present for URL pointing to an image article (eg. Unsplash)
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get footerIcon => throw _privateConstructorUsedError;
  @override
  String? get footer => throw _privateConstructorUsedError;
  @override
  String? get fallback => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  String? get assetUrl => throw _privateConstructorUsedError;
  @override
  double? get width => throw _privateConstructorUsedError;
  @override
  double? get height => throw _privateConstructorUsedError;
  @override
  Uri? get localUri => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}
