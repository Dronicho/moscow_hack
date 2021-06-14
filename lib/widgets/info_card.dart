import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/styles/colors.dart';
import 'package:intl/intl.dart';

import 'primary_button.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key,
      this.imageUrl,
      required this.editable,
      this.width = 130,
      this.height = 130})
      : super(key: key);

  final String? imageUrl;
  final bool editable;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return _InfoBase(
      onPressed: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: imageUrl != null
              ? DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl!),
                  fit: BoxFit.cover)
              : null,
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({Key? key, required this.user}) : super(key: key);

  final User user;
  final _format = DateFormat('dd.MM.yyyy');

  @override
  Widget build(BuildContext context) {
    final stats = user.stats;
    print(stats);

    return _InfoBase(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(user.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text(_format.format(user.createdAt!)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                StatTile(
                    value: stats.friendly,
                    icon: Icons.sentiment_satisfied,
                    title: 'Доброжелательный'),
                StatTile(
                    value: stats.competent,
                    icon: Icons.school,
                    title: 'Компетентен'),
                StatTile(
                    value: stats.leadership,
                    icon: Icons.groups,
                    title: 'Хороший лидер')
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class StatTile extends StatelessWidget {
  const StatTile(
      {Key? key, required this.value, required this.icon, required this.title})
      : super(key: key);

  final int value;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(
          width: 8,
        ),
        Icon(icon),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Text(title, maxLines: null, style: TextStyle(fontSize: 12))),
      ],
    );
  }
}

class RowCard extends StatelessWidget {
  const RowCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChange})
      : super(key: key);

  final String title;
  final String value;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return _InfoBase(
        onPressed: () async {
          final res = await showDialog<String>(
              context: context,
              builder: (context) => EditCardDialog(value: value, name: title));
          if (res != null) {
            onChange?.call(res);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title),
            Text(value,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
          ]),
        ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
      this.title,
      this.placeholder,
      this.subtitle,
      this.onPressed,
      this.style,
      this.editable = true,
      this.name,
      this.onChange,
      this.width,
      this.height})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final String? placeholder;
  final TextStyle? style;
  final double? width;
  final double? height;
  final bool editable;
  final VoidCallback? onPressed;

  final String? name;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (subtitle != null) {
      child = Column(
        children: [
          Text(subtitle!),
          Text(title != null ? title! : placeholder!, style: style),
        ],
      );
    } else {
      child = Text(title != null ? title! : placeholder!, style: style);
    }
    if (height != null) {
      child = Center(child: child);
    }
    return _InfoBase(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
      onPressed: () async {
        if (!editable) return;
        final res = await showDialog<String>(
            context: context,
            builder: (context) =>
                EditCardDialog(value: title ?? '', name: name ?? ''));
        if (res != null) {
          onChange?.call(res);
        }
      },
    );
  }
}

class _InfoBase extends StatelessWidget {
  const _InfoBase(
      {Key? key, required this.child, this.width, this.height, this.onPressed})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: primaryShadow,
            borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: child,
        ));
  }
}

class EditCardDialog extends StatefulWidget {
  const EditCardDialog({
    Key? key,
    required this.value,
    required this.name,
  }) : super(key: key);

  final String value;
  final String name;

  @override
  _EditCardDialogState createState() => _EditCardDialogState();
}

class _EditCardDialogState extends State<EditCardDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Введите ${widget.name}',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
              child: Text('Добавить'),
              onPressed: _controller.text.isNotEmpty
                  ? () {
                      Navigator.of(context).pop(_controller.text);
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
