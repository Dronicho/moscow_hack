import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:moscow/domain/models/project.dart';
import 'package:moscow/domain/utils/common_items.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/modules/app/bloc/loading_cubit.dart';
import 'package:moscow/modules/home/screens/profile/widgets/skills_widget.dart';
import 'package:moscow/modules/start_team/bloc/project_cubit.dart';
import 'package:moscow/modules/start_team/bloc/project_state.dart'
    as cubit_state;
import 'package:moscow/modules/start_team/widgets/project/widgets/swipe_view.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/info_card.dart';
import 'package:moscow/widgets/shimmers/user.dart';
import 'package:moscow/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';

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
              Text(project.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
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
                color: Colors.white,
                skills: project.skills ?? [],
                hightlight: context.read<AppCubit>().state.user.skills,
              ),
              SizedBox(
                height: 8,
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
                      content: '',
                      type: InfoDataType.link,
                      title: 'Дополнительные материалы',
                      builder: (context) => MaterialsPage(
                            materials: project.additionalMaterials,
                          )),
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
                      content:
                          DateFormat('dd.MM.yyyy').format(project.dateStart)),
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
                    builder: (context) => UserListView(
                        users: [project.owner!, ...(project.members ?? [])],
                        project: project)),
              if (project.isOwner)
                NavigationTile(
                    title: 'Заявки на участие',
                    builder: (context) => BlocProvider.value(
                        value: bloc, child: SwipeView(project: project))),
              if (!project.isMember)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PrimaryButton(
                    child: Text('Подать заявку'),
                    onPressed: project.requestedIds?.contains(
                                context.read<AppCubit>().state.user.id) ??
                            false
                        ? null
                        : () async {
                            context.read<LoadingCubit>().startLoading();
                            await context.read<ProjectCubit>().addRequest(
                                project, context.read<AppCubit>().state.user);
                            context.read<LoadingCubit>().stopLoading();
                          },
                  ),
                ),
              SizedBox(
                height: 50,
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

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({Key? key, required this.materials}) : super(key: key);

  final List<String>? materials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title:
              Text('Дополнительные материалы', style: TextStyle(fontSize: 24)),
        ),
        body: materials == null
            ? Center(child: Text('Ничего нет :('))
            : ListView.separated(
                itemCount: materials!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return FileAttachment(
                    url: materials![index],
                  );
                },
              ));
  }

  String _processName(String url) {
    return url.split('?').first.split('-').last;
  }
}

class FileAttachment extends StatefulWidget {
  final String url;
  final DateTime? createdAt;

  const FileAttachment({
    Key? key,
    required this.url,
    this.createdAt,
  }) : super(key: key);

  @override
  _FileAttachmentState createState() => _FileAttachmentState();
}

class _FileAttachmentState extends State<FileAttachment> {
  bool loading = false;
  bool downloaded = false;
  double progress = 0;
  var httpClient = HttpClient();
  late String filename;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (!downloaded) {
          _startDownload();
        } else {
          _openFile(context);
        }
      },
      child: Material(
        color: secondaryWhite,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 45,
                child: Material(
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            downloaded
                                ? Icons.insert_drive_file
                                : Icons.arrow_downward,
                            size: 20,
                          ),
                          if (loading)
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Container(
                                  padding: EdgeInsets.zero,
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 2,
                                  )),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(filename,
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            if (widget.createdAt != null)
                              Text(
                                  DateFormat.Hm('ru_RU')
                                      .format(widget.createdAt!),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.5))),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    filename = widget.url.split('?').first.split('-').last;
  }

  void _openFile(BuildContext context) async {
    var dir = (await getApplicationDocumentsDirectory()).path;
    OpenFile.open('$dir/$filename');
  }

  Future<File> _startDownload() async {
    setState(() {
      loading = true;
    });
    final request = Request('GET', Uri.parse(widget.url));
    final response = await Client().send(request);
    final contentLength = response.contentLength;
    var dir = (await getApplicationDocumentsDirectory()).path;
    var file = File('$dir/$filename');
    var bytes = <int>[];
    response.stream.listen(
      (List<int> newBytes) {
        setState(() {
          bytes.addAll(newBytes);
          final downloadedLength = bytes.length;
          progress = downloadedLength / contentLength!;
        });
      },
      onDone: () async {
        await file.writeAsBytes(bytes);
      },
      onError: (e) {
        print(e);
      },
      cancelOnError: true,
    );

    setState(() {
      loading = false;
      downloaded = true;
    });
    return file;
  }
}

enum InfoDataType { field, link }

class InfoData {
  final String title;
  final String content;
  final InfoDataType type;
  final WidgetBuilder? builder;

  InfoData(
      {this.builder,
      required this.title,
      required this.content,
      this.type = InfoDataType.field});
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
              if (d.type == InfoDataType.link) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: primaryShadow,
                        borderRadius: BorderRadius.circular(16)),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: d.builder!));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(d.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Icon(Icons.chevron_right)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
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
