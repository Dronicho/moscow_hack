import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:moscow/domain/services/api.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/primary_icon_button.dart';
import 'package:moscow/widgets/widgets.dart';

class UserSkillsWidget extends StatelessWidget {
  UserSkillsWidget({Key? key, this.withButton = true}) : super(key: key);

  final bool withButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SkillsWrapper(
            color: Colors.white,
            withButton: withButton,
            onDeleted: (value) {
              final newSkills = [...state.user.skills];
              newSkills.remove(value);
              context
                  .read<AppCubit>()
                  .updateUser(state.user.copyWith(skills: newSkills));
            },
            skills: state.user.skills,
            onCreated: (res) {
              context.read<AppCubit>().updateUser(
                  state.user.copyWith(skills: [...state.user.skills, res]));
            });
      },
    );
  }
}

class ProjectSkillsWidget extends StatelessWidget {
  const ProjectSkillsWidget(
      {Key? key, required this.skills, this.hightlight = const [], this.color})
      : super(key: key);

  final List<String> skills;
  final List<String> hightlight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SkillsWrapper(
      skills: skills,
      color: color,
      withButton: true,
      onCreated: (value) {},
      hightlight: hightlight,
      showButton: false,
      showUndo: false,
    );
  }
}

class SkillsWrapper extends StatefulWidget {
  const SkillsWrapper(
      {Key? key,
      required this.skills,
      required this.withButton,
      this.hightlight,
      this.extra,
      required this.onCreated,
      this.showButton = true,
      this.onDeleted,
      this.showUndo = true,
      this.color})
      : super(key: key);

  final List<String>? hightlight;
  final List<String> skills;
  final List<Widget>? extra;
  final ValueChanged<String> onCreated;
  final ValueChanged<String>? onDeleted;
  final Color? color;
  final bool withButton;
  final bool showUndo;
  final bool showButton;

  @override
  _SkillsWrapperState createState() => _SkillsWrapperState();
}

class _SkillsWrapperState extends State<SkillsWrapper> {
  bool _editing = false;
  bool _expanded = false;
  bool _expandable = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _editing = !widget.withButton;
      _expanded = widget.skills.length < 4;
      _expandable = !(widget.skills.length < 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (!_expandable) return;
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 5.0,
          runSpacing: 5.0,
          children: [
            ...widget.skills
                .sublist(0, _expanded ? widget.skills.length : 4)
                .map(
                  (e) => _buildChip(e),
                ),
            if (!_expanded) _buildChip('.....'),
            if (_editing)
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: !widget.withButton || _editing ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                      onTap: () async {
                        final res = await showDialog<String>(
                            context: context,
                            builder: (context) => AddSkillDialog());
                        if (res != null && res.isNotEmpty) {
                          widget.onCreated(res);
                        }
                      },
                      child: Chip(
                        label: Icon(Icons.add),
                      )),
                ),
              ),
            if (widget.showButton)
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryIconButton(
                    onPressed: () {
                      setState(() {
                        _editing = !_editing;
                      });
                    },
                    icon: Icons.edit,
                  )),
            ...(widget.extra ?? [])
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String name) {
    if (widget.hightlight?.contains(name) ?? false) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 4.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
        ),
      );
    }
    return Chip(
        visualDensity: _expandable
            ? VisualDensity(vertical: VisualDensity.minimumDensity)
            : null,
        padding: EdgeInsets.zero,
        backgroundColor: widget.color,
        label: Text(name),
        deleteIcon: _editing ? RemoveButton() : null,
        onDeleted: _editing
            ? () {
                widget.onDeleted?.call(name);
                if (widget.showUndo)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.all(8.0),
                      content: Text(name),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                          onPressed: () {
                            widget.onCreated(name);
                          },
                          label: '????????????????'),
                    ),
                  );
              }
            : null);
  }
}

class AddSkillDialog extends StatefulWidget {
  AddSkillDialog({Key? key}) : super(key: key);
  @override
  _AddSkillDialogState createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  final _api = GetIt.I<Api>();
  final _controller = TextEditingController();

  Future<List<String>> _suggetionsCallback(String search) async {
    final res = await _api.client
        .get(Uri.parse(_api.baseUrl + '/auto-completion/$search'));
    final data = jsonDecode(res.body);
    print(data);
    return data['autoCompletions'].cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('?????????????? ???????????????? ??????????????????????'),
            SizedBox(
              height: 10,
            ),
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '?????????????????? ??????????????????????'),
              ),
              suggestionsCallback: _suggetionsCallback,
              onSuggestionSelected: (String item) {
                _controller.text = item;
                setState(() {});
              },
              itemBuilder: (context, String item) {
                print(item);
                return ListTile(title: Text(item));
              },
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
              child: Text('????????????????'),
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

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
        child:
            Icon(Icons.close, color: Colors.white.withOpacity(0.6), size: 20));
  }
}
