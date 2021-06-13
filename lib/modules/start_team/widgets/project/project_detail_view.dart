import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/models/project.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/utils/common_items.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/modules/home/screens/profile/widgets/skills_widget.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart'
    as cubit_state;
import 'package:moscow/modules/start_team/widgets/project/widgets/swipe_view.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/info_card.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/user_list_view.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({Key? key, required this.tag, required this.project})
      : super(key: key);

  final Object tag;
  final Project project;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProjectCubit>();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(project.name, style: TextStyle(fontSize: 32)),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  project.area,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ),
              Hero(
                tag: tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(imageUrl: project.photoURL!),
                ),
              ),
              ProjectSkillsWidget(
                skills: project.skills ?? [],
                hightlight: context.read<AppCubit>().state.user.skills,
              ),
              Text('С этим проектом у вас совпадают ${_parseSkills(commonItems([
                    project.skills,
                    context.read<AppCubit>().state.user.skills
                  ]).length)}!'),
              SizedBox(
                height: 16,
              ),
              Text('Лидер проекта', style: TextStyle(fontSize: 16)),
              if (project.state == ProjectState.loading) UserShimmer(),
              if (project.state == ProjectState.loaded)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageCard(
                            editable: false,
                            imageUrl: project.owner!.photoUrl,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: InfoCard(
                                editable: false,
                                title: project.owner?.name,
                                style: TextStyle(fontSize: 22),
                                height: 130),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoCard(
                            editable: false,
                            title: project.owner?.phone,
                            style: TextStyle(fontSize: 16)),
                        InfoCard(
                            editable: false,
                            title: project.owner?.email,
                            style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Описаниe'),
              ),
              InfoCard(
                  name: 'name', editable: false, title: project.description),
              SizedBox(
                height: 8,
              ),
              NavigationTile(
                title: 'Технологии продукта',
                builder: (context) =>
                    InfoPage(title: 'Технологии продукта', data: [
                  InfoData(
                      title: 'Интеллектуальная собственность',
                      content: project.intellectualProperty),
                  InfoData(
                      title: 'Рыночное применение',
                      content: project.marketApplication),
                ]),
              ),
              NavigationTile(
                title: 'Рынок',
                builder: (context) => InfoPage(title: 'Рынок', data: [
                  InfoData(
                      title: 'Потребность / проблема', content: project.needs),
                  InfoData(
                      title: 'Рыночное применение',
                      content: project.marketApplication),
                  InfoData(
                      title: 'Ëмкость рынка и целевые потребители',
                      content: project.intellectualProperty),
                  InfoData(title: 'Конкуренты', content: project.competitors)
                ]),
              ),
              NavigationTile(
                title: 'О проекте',
                builder: (context) => InfoPage(title: 'О проекте', data: [
                  InfoData(
                      title: 'Дата запуска',
                      content: project.dateStart.toString()),
                  InfoData(
                      title: 'Ресурсы и инфраструктура',
                      content: project.resources),
                  InfoData(
                      title: 'Текущее состояние проекта',
                      content: project.status),
                  InfoData(title: 'Модель внедрения', content: project.model)
                ]),
              ),
              if (project.isMember)
                NavigationTile(
                    title: 'Список Участников',
                    builder: (context) =>
                        UserListView(users: project.members ?? [])),
              if (project.isOwner)
                NavigationTile(
                    title: 'Заявки на участие',
                    builder: (context) => BlocProvider.value(
                        value: bloc, child: SwipeView(project: project))),
              if (!project.isMember)
                PrimaryButton(
                  child: Text('Подать заявку'),
                  onPressed: () {},
                )
            ],
          ),
        ),
      ),
    );
  }

  String _parseSkills(int count) {
    final mod = count % 10;
    if (mod > 10 && mod < 20 || mod == 0) {
      return '$count компетенций';
    }
    if (mod == 1) {
      return '$count компетенция';
    }
    if (mod < 5) {
      return '$count компетенции';
    }
    return '$count компетенций';
  }
}

class InfoData {
  final String title;
  final String content;

  InfoData({required this.title, required this.content});
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, required this.data, required this.title})
      : super(key: key);

  final List<InfoData> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(title, style: TextStyle(fontSize: 24)),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              final d = data[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 0, 2),
                      child: Text(d.title, style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 5),
                    InfoCard(
                      name: 'name',
                      title: d.content,
                      editable: false,
                    )
                  ],
                ),
              );
            },
            itemCount: data.length));
  }
}

class UserShimmer extends StatelessWidget {
  const UserShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))),
                )
              ],
            )
          ],
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}

class NavigationTile extends StatelessWidget {
  const NavigationTile({Key? key, required this.title, this.builder})
      : super(key: key);

  final String title;
  final WidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (builder != null)
          Navigator.of(context).push(MaterialPageRoute(builder: builder!));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(title),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right))
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: primaryShadow),
        ),
      ),
    );
  }
}
