import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/widgets/add_project/bloc/add_project_cubit.dart';
import 'package:moscow/modules/start_team/widgets/messages/widgets/new_input.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/gradient_border.dart';
import 'package:moscow/widgets/image_loader.dart';
import 'package:moscow/widgets/input_fields/fields.dart';
import 'package:moscow/widgets/shimmers/container.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

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
                            Text('Создать проект',
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
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BlocBuilder<AddProjectCubit, AddProjectState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectField(
                              initText: state.project.name,
                              title: 'Название проекта',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(name: value));
                              }),
                          ProjectField(
                              initText: state.project.area,
                              title: 'Область',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(area: value));
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UploadField(
                                value: state.project.localImage,
                                title: 'Обложка проекта',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(localImage: value));
                                }),
                          ),
                          ProjectField(
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
                              initText: state.project.advantage,
                              title: 'Уникальное преимущество',
                              onChanged: (value) {
                                context.read<AddProjectCubit>().stateChanged(
                                    state.project.copyWith(advantage: value));
                              }),
                          DropdownField(
                              values: [
                                'идея',
                                'демонстрационный образец',
                                'продукт',
                                'масштабирование'
                              ],
                              value: state.project.stage,
                              title: 'Стадия готовности',
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(stage: value));
                                }
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MultiUploadField(
                                value: state.project.localMaterials,
                                title: 'Дополнительные проекты',
                                onChanged: (urls) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(localMaterials: urls));
                                }),
                          ),
                          ProjectField(
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
                              color: Theme.of(context).disabledColor,
                              child: Text('Назад'),
                              onPressed: () {
                                setState(() {
                                  _index = 0;
                                });
                                DefaultTabController.of(context)!.animateTo(0);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: PrimaryButton(
                              child: Text('Далее'),
                              onPressed: () {
                                setState(() {
                                  _index = 2;
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
                                initText: state.project.needs,
                                title: 'Потребность / проблема',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(needs: value));
                                }),
                            ProjectField(
                                initText: state.project.marketApplication,
                                title: 'Рыночное применение',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(marketApplication: value));
                                }),
                            ProjectField(
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
                                color: Theme.of(context).disabledColor,
                                child: Text('Назад'),
                                onPressed: () {
                                  setState(() {
                                    _index = 1;
                                  });
                                  DefaultTabController.of(context)!
                                      .animateTo(1);
                                },
                              ),
                            ),
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
                            DatePickerField(
                                value: state.project.dateStart,
                                title: 'Дата запуска',
                                onChanged: (date) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(dateStart: date));
                                }),
                            ProjectField(
                                initText: state.project.experience,
                                title: 'Опыт лидера',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project
                                          .copyWith(experience: value));
                                }),
                            ProjectField(
                                initText: state.project.resources,
                                title: 'Ресурсы и инфраструктура',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(resources: value));
                                }),
                            ProjectField(
                                initText: state.project.status,
                                title: 'Текущее состояние проекта',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(status: value));
                                }),
                            ProjectField(
                                initText: state.project.model,
                                title: 'Модель внедрения',
                                onChanged: (value) {
                                  context.read<AddProjectCubit>().stateChanged(
                                      state.project.copyWith(model: value));
                                }),
                            ProjectField(
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
                                color: Theme.of(context).disabledColor,
                                child: Text('Назад'),
                                onPressed: () {
                                  setState(() {
                                    _index = 2;
                                  });
                                  DefaultTabController.of(context)!
                                      .animateTo(2);
                                },
                              ),
                            ),
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
