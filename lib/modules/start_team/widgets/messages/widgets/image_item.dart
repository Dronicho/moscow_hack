import 'package:flutter/material.dart';

// TODO: rewrite without LocalImage(image property)
class ImageItem extends StatefulWidget {
  final dynamic image;
  final double width;
  final double height;
  const ImageItem({Key? key, required this.image, required this.width, required this.height})
      : super(key: key);

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Container(
                color: Colors.black87,
                child: Center(
                  child: Hero(
                    tag: widget.image.id,
                    child: FadeInImage(
                      placeholder:
                          AssetImage('assets/images/image_placeholder.jpg'),
                      image: AssetImage('assets/images/image_placeholder.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Hero(
        tag: widget.image.id,
        child: Container(
          height: widget.height,
          width: widget.width,
          color: Colors.white,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/image_placeholder.jpg'),
            image: AssetImage('assets/images/image_placeholder.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
