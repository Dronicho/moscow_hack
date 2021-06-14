import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String value;
  final String title;
  final ValueChanged<String?> onChanged;
  DropdownField(
      {Key? key,
      required this.value,
      required this.values,
      required this.title,
      required this.onChanged})
      : super(key: key);

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black45),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              value: value,
              onChanged: onChanged,
              items: values
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
            )),
          ),
        )
      ]),
    );
  }
}
