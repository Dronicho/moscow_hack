import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moscow/domain/blocs/authentication/authentication.dart';
import 'package:moscow/domain/services/firebase_storage.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/info_card.dart';
import 'package:moscow/widgets/primary_button.dart';
import 'package:intl/intl.dart';

import 'widgets/skills_widget.dart';

class ProfilePage extends StatelessWidget {
  final _picker = ImagePicker();
  final _storage = GetIt.I<FirebaseStorageService>();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final user = state.user;
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Профиль',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w500)),
                          Text('При нажатии на поле его можно отредактировать',
                              style: TextStyle(fontSize: 10))
                        ]),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.8')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Общая информация'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageCard(
                        editable: false,
                        imageUrl:
                            'https://images.unsplash.com/photo-1557862921-37829c790f19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1651&q=80'),
                    SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: InfoCard(
                        name: 'name',
                        editable: false,
                        title: 'Andrey Nebogatikov Stanislaw',
                        style: TextStyle(fontSize: 22),
                        height: 130,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoCard(
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      onChange: (value) {
                        context
                            .read<AppCubit>()
                            .updateUser(user.copyWith(phone: value));
                      },
                      title: user.phone,
                      name: 'Телефон',
                      placeholder: 'Нажмите, чтобы добавить телефон',
                    ),
                    InfoCard(
                      title: user.email,
                      onChange: (value) {
                        context
                            .read<AppCubit>()
                            .updateUser(user.copyWith(email: value));
                      },
                      name: 'Почта',
                      placeholder: 'Нажмите, чтобы добавить почту',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                InfoCard(
                  title: user.about,
                  onChange: (value) {
                    context
                        .read<AppCubit>()
                        .updateUser(user.copyWith(about: value));
                  },
                  name: 'Описание',
                  placeholder: 'Нажмите, чтобы добавить описание',
                ),
                UserSkillsWidget(),
                SizedBox(height: 16),
                InfoCard(
                    name: 'Снилс',
                    onChange: (value) {
                      context
                          .read<AppCubit>()
                          .updateUser(user.copyWith(snils: value));
                    },
                    title: user.snils,
                    subtitle: 'Снилс',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                SizedBox(
                  height: 16,
                ),
                DataCard(
                    name: 'Образование',
                    title: 'Университет ИТМО',
                    subtitle: 'Программная инженерия',
                    body: 'бакалaвр',
                    start: DateTime.now(),
                    end: DateTime.now()),
                SizedBox(
                  height: 16,
                ),
                DataCard(
                  name: 'Образование',
                  title: 'Университет ИТМО',
                  subtitle: 'Программная инженерия',
                  body: 'бакалaвр',
                  start: DateTime.now(),
                  end: DateTime.now(),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       context
                //           .read<AuthenticationBloc>()
                //           .add(AuthenticationLogoutRequested());
                //     },
                //     child: Text('Выйти'))
              ],
            ),
          );
        },
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard(
      {Key? key,
      required this.name,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.start,
      required this.end})
      : super(key: key);

  final String name;
  final String title;
  final String subtitle;
  final String body;
  final DateTime start;
  final DateTime end;

  final _format = DateFormat('dd.MM.yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: primaryShadow,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
            ),
            Text(subtitle, style: TextStyle(fontSize: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(body, style: TextStyle(fontSize: 10)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_format.format(start)),
                Text(_format.format(end))
              ],
            )
          ],
        ),
      ),
    );
  }
}
