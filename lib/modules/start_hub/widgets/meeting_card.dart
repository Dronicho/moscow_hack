import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moscow/domain/models/event.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/shimmers/container.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  EventCard(
      {Key? key,
      required this.onPressed,
      this.running = false,
      this.tag,
      this.highlight = false,
      required this.event})
      : super(key: key);
  final VoidCallback onPressed;
  final Event event;
  final Object? tag;
  final bool running;
  final bool highlight;
  final _format = DateFormat('dd MMM');

  @override
  Widget build(BuildContext context) {
    var child = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            children: [
              _buildBackground(context),
              if (event.photoURL != null)
                Positioned.fill(
                    child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.6)
                    ],
                    stops: [0.7, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                )),
              if (running)
                Positioned(
                    left: 16,
                    top: 16,
                    child: Chip(
                      backgroundColor: Colors.green,
                      label: Text('началось',
                          style: TextStyle(color: Colors.white)),
                    )),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: highlight ? primaryGradient : null,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          _format.format(event.date), // date
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          event.times[0].toString().substring(10, 15), // time
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      child: Text(
                        event.name,
                        maxLines: null,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    if (tag != null) {
      return Hero(
        tag: tag!,
        child: child,
      );
    }
    return child;
  }

  Widget _buildBackground(BuildContext context) {
    late var res;
    if (event.photoURL != null) {
      res = CachedNetworkImage(
        fadeInDuration: Duration(milliseconds: 100),
        imageUrl: event.photoURL!,
        placeholder: (context, url) => ContainerShimmer(),
      );
    } else {
      res = Container(
        height: 250,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff8E2DE2), Color(0xFF4A00E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      );
    }
    return res;
  }
}
