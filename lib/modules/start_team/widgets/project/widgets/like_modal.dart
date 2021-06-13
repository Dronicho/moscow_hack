import 'package:flutter/material.dart';
import 'package:moscow/widgets/widgets.dart';

typedef LikedFunction = void Function(bool, bool, bool);

class LikeModal extends StatefulWidget {
  const LikeModal({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final LikedFunction onPressed;

  @override
  _LikeModalState createState() => _LikeModalState();
}

class _LikeModalState extends State<LikeModal> {
  bool _satisfied = false;
  bool _school = false;
  bool _groups = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Container(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Похвалить',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    Text('в i.moscow с 15.05.2021')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryIconButton(
                        size: 36,
                        decorate: _satisfied,
                        onPressed: () {
                          setState(() {
                            _satisfied = !_satisfied;
                          });
                        },
                        icon: Icons.sentiment_satisfied_alt),
                    PrimaryIconButton(
                        size: 36,
                        decorate: _school,
                        onPressed: () {
                          setState(() {
                            _school = !_school;
                          });
                        },
                        icon: Icons.school),
                    PrimaryIconButton(
                        size: 36,
                        decorate: _groups,
                        onPressed: () {
                          setState(() {
                            _groups = !_groups;
                          });
                        },
                        icon: Icons.groups)
                  ],
                ),
                PrimaryButton(
                  child: Text('Похвалить'),
                  onPressed: _groups || _school || _satisfied
                      ? () {
                          widget.onPressed(_satisfied, _school, _groups);
                          Navigator.of(context).pop();
                        }
                      : null,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
        ),
      ),
    );
  }
}
