import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/services/Messaging.dart';
import 'package:moscow/modules/registration/cubit/login_cubit.dart';

import '../../constants.dart';
import 'base_repostitory.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  authenticatedFirstTime
}

class AuthenticationRepository extends BaseRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield await _trySavedLogin();
    yield* _controller.stream;
  }

  Future<AuthenticationStatus> _trySavedLogin() async {
    final token = storage.get(AUTH_SAVE_KEY);
    if (token != null && token.isNotEmpty) {
      return AuthenticationStatus.authenticated;
    }
    return AuthenticationStatus.unauthenticated;
  }

  Future<void> updateUser(
      {required String name,
      required String lastName,
      required String sex,
      required List<String> clubs,
      bool updateFirstTime = false}) async {
    await storage.saveBool(FIRST_TIME_KEY, false);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<User?> register(LoginState state) async {
    print(state.user.localImage);
    var body =
        state.user.copyWith(photoUrl: state.user.localImage?.url).toJson();
    print(body);
    body.addAll({'password': state.password});
    final res = await client.post(Uri.parse(api.baseUrl + '/user'), body: body);
    final data = jsonDecode(res.body);
    print(data);
    if (data['message'] == 'ok') {
      storage.save(AUTH_SAVE_KEY, data['token']);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  Future<User?> logIn({
    required String username,
    required String password,
    required String token,
  }) async {
    var res = await client.post(Uri.parse(api.baseUrl + '/auth'),
        headers: {'Content-Type': 'application/json'},
        body: {'email': username, 'password': password, 'deviceToken': token});
    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['token'];
      await storage.save(AUTH_SAVE_KEY, token);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    storage.delete(AUTH_SAVE_KEY);
  }

  void dispose() => _controller.close();
}
