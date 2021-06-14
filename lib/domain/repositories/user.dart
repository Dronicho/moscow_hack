import 'dart:convert';

import 'package:moscow/domain/models/user.dart';

import 'base_repostitory.dart';

class UserRepository extends BaseRepository {
  Future<User?> getUser() async {
    print('getting user');
    try {
      var res = await api.client.get(Uri.parse(api.baseUrl + '/user'));
      final data = jsonDecode(res.body);
      print(data['user']);
      return User.fromJson(data['user']);
    } catch (err) {
      print(err);
    }
  }

  Future<User?> getUserById(String id) async {
    try {
      var res = await api.client.get(Uri.parse(api.baseUrl + '/user/$id'));
      final data = jsonDecode(res.body);
      print(data);
      return User.fromJson(data['user']);
    } catch (err) {
      print(err);
    }
  }

  Future<void> updateUser(User user) async {
    try {
      final res = await api.client
          .put(Uri.parse(api.baseUrl + '/user'), body: user.toJson());
    } catch (err) {
      print(err);
    }
  }
}
