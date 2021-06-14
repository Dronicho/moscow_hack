import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  final DateTime value;
  final String title;
  final ValueChanged<DateTime> onChanged;
  DatePickerField(
      {Key? key,
      required this.value,
      required this.title,
      required this.onChanged})
      : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final _format = DateFormat('dd.MM.yyyy');
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.title),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black45),
              borderRadius: BorderRadius.circular(8)),
          child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  final res = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: _date.subtract(Duration(days: 365 * 15)),
                      lastDate: _date.add(Duration(days: 365 * 15)));
                  if (res != null) {
                    widget.onChanged(res);
                    setState(() {
                      _date = res;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Text(_format.format(_date)),
                ),
              )),
        )
      ]),
    );
  }
}
