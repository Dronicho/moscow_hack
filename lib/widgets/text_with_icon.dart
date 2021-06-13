import 'package:flutter/material.dart';
import 'package:moscow/styles/colors.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: secondaryColor),
        SizedBox(
          width: 5,
        ),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: secondaryColor))
      ],
    );
  }
}
