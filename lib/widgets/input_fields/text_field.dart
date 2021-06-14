import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectField extends HookWidget {
  final String initText;
  final String title;
  final ValueChanged<String> onChanged;

  const ProjectField(
      {required this.initText,
      required this.title,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initText);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 5,
          ),
          TextField(
            maxLines: null,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    );
  }
}