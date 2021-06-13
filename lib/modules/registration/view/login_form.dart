import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/modules/home/screens/profile/widgets/skills_widget.dart';
import 'package:moscow/modules/registration/cubit/login_cubit.dart';
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
              body: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _EmailInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _UsernameInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _PhoneInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _PasswordInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _SnilsInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _AboutInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Компетенции'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserSkillsWidget(
                          withButton: false,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _LoginButton(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _SchoolNameInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _SpecialtyInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _GradeInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _EducationStartInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _EducationEndInput(),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                            onPressed: () {
                              DefaultTabController.of(context)!.animateTo(2);
                              setState(() {
                                _index = 2;
                              });
                            },
                            child: Text('Далее')),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _CompanyNameInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _PositionInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _WorkStartInput(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _WorkEndInput(),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _LoginButton(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _WorkEndInput extends StatelessWidget {
  const _WorkEndInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Дата окончания работы'),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xFFD4D4D4))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
                  child: InkWell(
                    onTap: () async {
                      final res = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(Duration(days: 365 * 11)),
                          firstDate: DateTime.now()
                              .subtract(Duration(days: 365 * 40)));
                      if (res != null) {
                        context
                            .read<LoginCubit>()
                            .workChanged(state.works[0].copyWith(dateEnd: res));
                      }
                    },
                    child: Text(
                      _parseDate(state.works[0].dateEnd),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

class _WorkStartInput extends StatelessWidget {
  const _WorkStartInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Дата начала работу'),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xFFD4D4D4))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
                  child: InkWell(
                    onTap: () async {
                      final res = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(Duration(days: 365 * 11)),
                          firstDate: DateTime.now()
                              .subtract(Duration(days: 365 * 40)));
                      if (res != null) {
                        print(res);
                        context.read<LoginCubit>().workChanged(
                            state.works[0].copyWith(dateStart: res));
                      }
                    },
                    child: Text(
                      _parseDate(state.works[0].dateStart),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

class _PositionInput extends HookWidget {
  const _PositionInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.works[0].position);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return TextField(
            controller: controller,
            key: const Key('loginForm_usernameInput_textField'),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Должность'),
            onChanged: (username) => context
                .read<LoginCubit>()
                .workChanged(state.works[0].copyWith(position: username)));
      },
    );
  }
}

class _CompanyNameInput extends HookWidget {
  const _CompanyNameInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.works[0].name);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return TextField(
            controller: controller,
            key: const Key('loginForm_usernameInput_textField'),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Название компании'),
            onChanged: (username) => context
                .read<LoginCubit>()
                .workChanged(state.works[0].copyWith(name: username)));
      },
    );
  }
}

class _EducationStartInput extends StatelessWidget {
  const _EducationStartInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.education != current.education,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Дата начала обучения'),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xFFD4D4D4))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
                  child: InkWell(
                    onTap: () async {
                      final res = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(Duration(days: 365 * 11)),
                          firstDate: DateTime.now()
                              .subtract(Duration(days: 365 * 40)));
                      if (res != null) {
                        context.read<LoginCubit>().educationChanged(
                            state.education[0].copyWith(dateStart: res));
                      }
                    },
                    child: Text(
                      _parseDate(state.education[0].dateStart),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

class _EducationEndInput extends StatelessWidget {
  const _EducationEndInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.education != current.education,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('Дата окончания обучения'),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xFFD4D4D4))),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 14),
                    child: InkWell(
                      onTap: () async {
                        final res = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(Duration(days: 365 * 11)),
                            firstDate: DateTime.now()
                                .subtract(Duration(days: 365 * 40)));
                        if (res != null) {
                          print(res);
                          context.read<LoginCubit>().educationChanged(
                              state.education[0].copyWith(dateEnd: res));
                        }
                      },
                      child: Text(
                        _parseDate(state.education[0].dateEnd),
                      ),
                    ))),
          ],
        );
      },
    );
  }
}

class _GradeInput extends HookWidget {
  const _GradeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.education != current.education,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: Color(0xFFD4D4D4))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  hint: Text('Степень'),
                  value: state.education[0].degree.isEmpty
                      ? null
                      : state.education[0].degree,
                  isExpanded: true,
                  onChanged: (String? value) {
                    if (value != null)
                      context.read<LoginCubit>().educationChanged(
                          state.education[0].copyWith(degree: value));
                  },
                  items: [
                    DropdownMenuItem(child: Text('Бакалвр'), value: 'Бакалавр'),
                    DropdownMenuItem(child: Text('Магистр'), value: 'Магистр')
                  ]),
            ),
          ),
        );
      },
    );
  }
}

class _SpecialtyInput extends HookWidget {
  const _SpecialtyInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.education[0].specialty);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Специализация'),
          onChanged: (username) => context.read<LoginCubit>().educationChanged(
              state.education[0].copyWith(specialty: username)),
        );
      },
    );
  }
}

class _SchoolNameInput extends HookWidget {
  const _SchoolNameInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.education[0].name);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.works != current.works,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Название учреждения'),
          onChanged: (username) => context
              .read<LoginCubit>()
              .educationChanged(state.education[0].copyWith(name: username)),
        );
      },
    );
  }
}

class _SnilsInput extends HookWidget {
  const _SnilsInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.snils.value);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.snils != current.snils,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'Снилс'),
          onChanged: (username) =>
              context.read<LoginCubit>().snilsChanged(username),
        );
      },
    );
  }
}

class _EmailInput extends HookWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.email.value);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'Почта'),
          onChanged: (username) =>
              context.read<LoginCubit>().emailChanged(username),
        );
      },
    );
  }
}

class _AboutInput extends HookWidget {
  const _AboutInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.about.value);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.about != current.about,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'О себе'),
          onChanged: (username) =>
              context.read<LoginCubit>().aboutChanged(username),
        );
      },
    );
  }
}

class _PhoneInput extends HookWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.phone.value);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        controller.text = state.phone.value;
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Телефон'),
          onChanged: (username) =>
              context.read<LoginCubit>().phoneChanged(username),
        );
      },
    );
  }
}

class _UsernameInput extends HookWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.name.value);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_usernameInput_textField'),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Имя пользователя'),
          onChanged: (username) =>
              context.read<LoginCubit>().usernameChanged(username),
        );
      },
    );
  }
}

class _PasswordInput extends HookWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
        text: context.read<LoginCubit>().state.password.value);
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          controller: controller,
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: true,
          textInputAction: TextInputAction.next,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'Пароль'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return PrimaryButton(
          onPressed: state.status.isValidated
              ? () {
                  context.read<LoginCubit>().register();
                }
              : null,
          child: state.status.isSubmissionInProgress
              ? CircularProgressIndicator()
              : Text(
                  'Зарегистрироваться',
                ),
        );
      },
    );
  }
}
