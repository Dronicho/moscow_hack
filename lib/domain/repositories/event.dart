import 'dart:convert';

import 'package:moscow/domain/models/event.dart';
import 'package:moscow/domain/repositories/base_repostitory.dart';

class EventRepository extends BaseRepository {
  Future<List<Event>> loadEvents() async {
    final res = await api.client.get(Uri.parse(api.baseUrl + '/events'));
    final data = jsonDecode(res.body);
    if (data['message'] == 'ok') {
      return data['events']
          .map((e) => Event.fromJson(e))
          .toList()
          .cast<Event>();
    }
    return [];
  }
}
