import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/widgets/add_project/bloc/add_project_cubit.dart';
import 'package:moscow/widgets/gradient_border.dart';
import 'package:moscow/widgets/image_loader.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/add_project_state.dart';

class AddProjectView extends StatefulWidget {
  const AddProjectView({Key? key}) : super(key: key);

  @override
  _AddProjectViewState createState() => _AddProjectViewState();
}

class _AddProjectViewState extends State<AddProjectView> {
  int _index = 0;
  List<String> get _messages =>
      ['Общая информация', 'Технология продукта', 'Рынок', 'О проекте'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, scrolled) => [
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Регистрация',
                                style: Theme.of(context).textTheme.headline6),
                            Text(_messages[_index])
                          ],
                        ),
                        Text('Шаг ${_index + 1} из ${_messages.length}')
                      ],
                    )
                  ])),
                )
              ],
              body: TabBarView(
                children: [
                  BlocBuilder<AddProjectCubit, AddProjectState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectField(
                              hint: 'Название',
                              initText: state.project.name,
                              title: 'Название проекта',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(name: value));
                              }),
                          ProjectField(
                              hint: 'Отрасль',
                              initText: state.project.area,
                              title: 'Название проекта',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(area: value));
                              }),
                          ProjectField(
                              hint: 'Описание',
                              initText: state.project.description,
                              title: 'Описание',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(description: value));
                              }),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: PrimaryButton(
                              child: Text('Далее'),
                              onPressed: () {
                                setState(() {
                                  _index = _index + 1;
                                });
                                DefaultTabController.of(context)!.animateTo(1);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AddProjectCubit, AddProjectState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectField(
                              hint: 'Преимущество',
                              initText: state.project.advantage,
                              title: 'Уникальное преимущество',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(advantage: value));
                              }),
                          ProjectField(
                              hint: 'Стадия',
                              initText: state.project.stage,
                              title: 'Стадия готовности',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(stage: value));
                              }),
                          ProjectField(
                              hint: 'Интеллектуальная собственность',
                              initText: state.project.intellectualProperty,
                              title: 'Интеллектуальная собственность',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project
                                        .copyWith(intellectualProperty: value));
                              }),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: PrimaryButton(
                              child: Text('Далее'),
                              onPressed: () {
                                setState(() {
                                  _index = _index + 1;
                                });
                                DefaultTabController.of(context)!.animateTo(2);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  BlocBuilder<AddProjectCubit, AddProjectState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProjectField(
                                hint: 'Проблема',
                                initText: state.project.needs,
                                title: 'Потребность / проблема',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(needs: value));
                                }),
                            ProjectField(
                                hint: '',
                                initText: state.project.marketApplication,
                                title: 'Рыночное применение',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(marketApplication: value));
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UploadField(
                                  initText: '',
                                  title: 'Обложка проекта',
                                  hint: 'hint',
                                  onChanged: (value) {}),
                            ),
                            ProjectField(
                                hint: '',
                                initText: state.project.competitors,
                                title: 'Конкуренты',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(competitors: value));
                                }),
                            // Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: PrimaryButton(
                                child: Text('Далее'),
                                onPressed: () {
                                  setState(() {
                                    _index = _index + 1;
                                  });
                                  DefaultTabController.of(context)!
                                      .animateTo(3);
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<AddProjectCubit, AddProjectState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProjectField(
                                hint: 'Дата',
                                initText: state.project.dateStart.toString(),
                                title: 'Дата запуска',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(
                                          dateStart: DateTime.parse(value)));
                                }),
                            ProjectField(
                                hint: 'Стадия',
                                initText: state.project.stage,
                                title: 'Опыт лидера',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(stage: value));
                                }),
                            ProjectField(
                                hint: 'ресу',
                                initText: state.project.resources,
                                title: 'Ресурсы и инфраструктура',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(resources: value));
                                }),
                            ProjectField(
                                hint: '',
                                initText: state.project.status,
                                title: 'Текущее состояние проекта',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(status: value));
                                }),
                            ProjectField(
                                hint: '',
                                initText: state.project.model,
                                title: 'Модель внедрения',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(model: value));
                                }),
                            ProjectField(
                                hint: '',
                                initText: state.project.plan,
                                title: 'План развития',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(plan: value));
                                }),
                            // Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: PrimaryButton(
                                child: state.loading
                                    ? CircularProgressIndicator()
                                    : Text('Добавить'),
                                onPressed: () async {
                                  await context
                                      .read<AddProjectCubit>()
                                      .addProject();
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class UploadField extends StatefulWidget {
  const UploadField(
      {Key? key,
      required this.initText,
      required this.title,
      required this.hint,
      required this.onChanged})
      : super(key: key);

  final String initText;
  final String title;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  _UploadFieldState createState() => _UploadFieldState();
}

class _UploadFieldState extends State<UploadField> {
  File? _image;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    var child;
    if (_loading) {
      child = GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: Shimmer.fromColors(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: MediaQuery.of(context).size.width - 18,
                ),
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!),
          onPressed: () async {
            setState(() {
              _loading = true;
            });
            final data = await ImageLoader.of(context)!.uploadImage();
            setState(() {
              _loading = false;
              _image = data.file;
            });
          });
    } else if (_image == null) {
      child = GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 16)),
                Text('нажмите, чтобы выбрать изображение')
              ],
            ),
          ),
          onPressed: () async {
            setState(() {
              _loading = true;
            });
            final data = await ImageLoader.of(context)!.uploadImage();
            setState(() {
              _loading = false;
              _image = data.file;
            });
          });
    } else {
      child = GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.memory(_image!.readAsBytesSync()),
                    Positioned(
                      height: 30,
                      width: 30,
                      top: 16,
                      right: 16,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 1,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        fillColor: Colors.grey.withOpacity(1),
                        child: Center(
                          child:
                              Icon(Icons.close, size: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))),
      );
    }

    return child;
  }
}

class ProjectField extends HookWidget {
  final String initText;
  final String title;
  final String hint;
  final ValueChanged<String> onChanged;

  const ProjectField(
      {required this.hint,
      required this.initText,
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
                hintText: hint),
          )
        ],
      ),
    );
  }
}
