import 'dart:convert';

import 'package:moscow/domain/models/event.dart';
import 'package:moscow/domain/models/project.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/repositories/base_repostitory.dart';
import 'package:moscow/modules/start_team/widgets/add_project/bloc/add_project_state.dart';

class ProjectRepository extends BaseRepository {
  Future<List<Project>> loadProjects([String extra = '']) async {
    final res =
        await api.client.get(Uri.parse(api.baseUrl + '/projects' + extra));
    final data = jsonDecode(res.body);
    print('------------------------');
    print(data);
    if (data['message'] == 'ok') {
      if (data['projects'] == null) return [];
      print(data['projects']);
      return data['projects']
              .map((e) => Project.fromJson(e))
              .toList()
              .cast<Project>() ??
          null;
    }
    return [];
  }

  Future<void> removeRequest(Project project, User user) async {
    await api.client.delete(Uri.parse(
        api.baseUrl + '/project/${project.id}/delete-request/${user.id}'));
  }

  Future<void> addProject(AddProjectState state) async {
    final res = await api.client.post(Uri.parse(api.baseUrl + '/project'),
        body: state.project.toJson());
  }
}
