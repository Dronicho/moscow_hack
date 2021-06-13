import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moscow/domain/models/attachment.dart';
import 'package:moscow/domain/models/message.dart';
import 'package:moscow/widgets/image_widget.dart';

class ImageAttachment extends StatelessWidget {
  final Attachment attachment;
  final Message message;
  final Size? size;

  const ImageAttachment({
    Key? key,
    required this.attachment,
    required this.message,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = _calculateSize(context);

    return Stack(
      children: [
        Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(SizeRoute(
                          page: ImagePage(
                        height: MediaQuery.of(context).size.height,
                        image: CachedNetworkImageProvider(attachment.imageUrl),
                        id: message.id! + attachment.imageUrl,
                      )));
                    },
                    child: CachedNetworkImage(
                      imageBuilder: (context, image) => ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox(
                          child: Hero(
                              // flightShuttleBuilder: (context,
                              //     animation,
                              //     flightDirection,
                              //     fromHeroContext,
                              //     toHeroContext) {
                              //   print((context.ratio()));
                              //   final toHero = toHeroContext.widget as Hero;
                              //   print(animation.value);
                              //   return SizedBox(
                              //       width: size.width,
                              //       height: size.height,
                              //       child: toHero.child);
                              // },
                              tag: message.id! + attachment.imageUrl,
                              child: Container(
                                color: Colors.black,
                                child: Image(
                                  image: image,
                                ),
                              )),
                        ),
                      ),
                      placeholder: (_, __) {
                        return Container(
                          width: size.width,
                          height: size.height,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      imageUrl: attachment.imageUrl,
                      errorWidget: (context, url, error) => AttachmentError(
                        attachment: attachment,
                        size: size,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(DateFormat.Hm('ru_RU').format(message.createdAt),
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Tween<Rect> createRectTween(Rect begin, Rect end) {
    return Tween<Rect>(begin: begin, end: end);
  }

  Size _calculateSize(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var pixelsRatio = MediaQuery.of(context).devicePixelRatio;
    var realSize =
        Size(screenSize.width * pixelsRatio, screenSize.height * pixelsRatio);
    // var photoSize = Size(attachment.width / pixelsRatio, attachment.height / pixelsRatio);
    final height = attachment.height! / pixelsRatio;
    final width = attachment.width! / pixelsRatio;
    var ratio = attachment.height! / attachment.width!;
    if (height < realSize.width * 0.7 - 50) {
      var w = max(width * 1.2, screenSize.width * 0.35);
      return Size(w, w * ratio);
    }

    if (attachment.width != null) {
      return Size(screenSize.width * 0.6, screenSize.width * 0.6 * ratio);
    }

    return Size(screenSize.width * 0.6, screenSize.height * 0.8);
  }
}

class AttachmentError extends StatelessWidget {
  final Attachment attachment;
  final Size? size;

  const AttachmentError({
    Key? key,
    required this.attachment,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size?.width,
        height: size?.height,
        color: Color(0xffd0021B).withOpacity(.1),
        child: Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key? key,
    required this.maxRadius,
    required this.child,
  })  : clipRectSize = 2.0 * (maxRadius / sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child, // Photo
          ),
        ),
      ),
    );
  }
}
