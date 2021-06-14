import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/home/screens/profile/widgets/skills_widget.dart';
import 'package:moscow/modules/registration/cubit/login_cubit.dart';
import 'package:moscow/widgets/input_fields/fields.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:intl/intl.dart';

final _format = DateFormat('dd MMM, yyyy');

String _parseDate(DateTime? date) {
  return date != null ? _format.format(date) : 'Нажмите, чтобы выбрать';
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  int _index = 0;
  List<String> _messages = ['Общая информация', 'Образование', 'Работа'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Регистрация',
                                style: Theme.of(context).textTheme.headline6),
                            Text(_messages[_index])
                          ],
                        ),
                        Text('Шаг ${_index + 1} из 3')
                      ],
                    )
                  ])),
                )
              ],
              body: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) => TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProjectField(
                              initText: state.user.fio,
                              title: 'ФИО',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(fio: value));
                              }),
                          ProjectField(
                              initText: state.user.phone ?? '',
                              title: 'Телефон',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(phone: value));
                              }),
                          ProjectField(
                              initText: state.user.email,
                              title: 'Email',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(email: value));
                              }),
                          ProjectField(
                              initText: state.password,
                              title: 'Придумайте пароль',
                              onChanged: (value) {
                                context
                                    .read<LoginCubit>()
                                    .passwordChanged(value);
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UploadField(
                                value: state.user.localImage,
                                title: 'Фото профиля',
                                onChanged: (file) {
                                  context.read<LoginCubit>().userChanged(
                                      state.user.copyWith(localImage: file));
                                }),
                          ),
                          ProjectField(
                              initText: state.user.about ?? '',
                              title: 'О себе',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(about: value));
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Компетенции'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SkillsWrapper(
                              skills: state.user.skills,
                              onDeleted: (value) {
                                final newSkills = state.user.skills;
                                newSkills.remove(value);
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(skills: newSkills));
                              },
                              onCreated: (value) {
                                context.read<LoginCubit>().userChanged(
                                    state.user.copyWith(
                                        skills: [...state.user.skills, value]));
                              },
                              withButton: false,
                              showButton: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryButton(
                              onPressed: () {
                                DefaultTabController.of(context)!.animateTo(1);
                                setState(() {
                                  _index = 1;
                                });
                              },
                              child: Text('Далее'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ProjectField(
                              initText: state.user.education![0]!.name,
                              title: 'Учебное заведение',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(education: [
                                      state.user.education![0]!
                                          .copyWith(name: value)
                                    ]));
                              }),
                          ProjectField(
                              initText: state.user.education![0]!.specialty,
                              title: 'Специализация',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(education: [
                                      state.user.education![0]!
                                          .copyWith(specialty: value)
                                    ]));
                              }),
                          DropdownField(
                              values: [
                                'Бакалавр',
                                'Магистратура',
                                'Полное среднее'
                              ],
                              value: state.user.education![0]!.degree,
                              title: 'Степень',
                              onChanged: (value) {
                                if (value != null)
                                  context.read<LoginCubit>().userChanged(
                                          state.user.copyWith(education: [
                                        state.user.education![0]!
                                            .copyWith(degree: value)
                                      ]));
                              }),
                          DatePickerField(
                              value: state.user.education![0]!.dateStart!,
                              title: 'Дата начала учебы',
                              onChanged: (date) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(education: [
                                      state.user.education![0]!
                                          .copyWith(dateStart: date)
                                    ]));
                              }),
                          DatePickerField(
                              value: state.user.education![0]!.dateEnd!,
                              title: 'Дата окончания учебы',
                              onChanged: (date) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(education: [
                                      state.user.education![0]!
                                          .copyWith(dateEnd: date)
                                    ]));
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryButton(
                                onPressed: () {
                                  DefaultTabController.of(context)!
                                      .animateTo(2);
                                  setState(() {
                                    _index = 2;
                                  });
                                },
                                child: Text('Далее')),
                          ),
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
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ProjectField(
                              initText: state.user.work![0]!.name,
                              title: 'Наименование компании',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(work: [
                                      state.user.work![0]!.copyWith(name: value)
                                    ]));
                              }),
                          ProjectField(
                              initText: state.user.work![0]!.position,
                              title: 'Должность',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(work: [
                                      state.user.work![0]!
                                          .copyWith(position: value)
                                    ]));
                              }),
                          DatePickerField(
                              value: state.user.work![0]!.dateStart!,
                              title: 'Дата начала работы',
                              onChanged: (date) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(work: [
                                      state.user.work![0]!
                                          .copyWith(dateStart: date)
                                    ]));
                              }),
                          DatePickerField(
                              value: state.user.work![0]!.dateEnd!,
                              title: 'Дата окончания работы',
                              onChanged: (date) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(work: [
                                      state.user.work![0]!
                                          .copyWith(dateEnd: date)
                                    ]));
                              }),
                          ProjectField(
                              initText: state.user.work![0]!.responsibilities,
                              title: 'Описание обязанностей',
                              onChanged: (value) {
                                context.read<LoginCubit>().userChanged(
                                        state.user.copyWith(work: [
                                      state.user.work![0]!
                                          .copyWith(responsibilities: value)
                                    ]));
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryButton(
                              loading: state.loading,
                              onPressed: () {
                                context.read<LoginCubit>().register();
                              },
                              child: Text('Зарегистрироваться'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: PrimaryButton(
                              color: Theme.of(context).disabledColor,
                              child: Text('Назад'),
                              onPressed: () {
                                setState(() {
                                  _index = 1;
                                });
                                DefaultTabController.of(context)!.animateTo(1);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
