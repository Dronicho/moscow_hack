import 'dart:async';
import 'dart:convert';

import 'package:moscow/domain/models/user.dart';
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
    final res = await client.post(Uri.parse(api.baseUrl + '/user'), body: {
      'fio': state.name.value,
      'password': state.password.value,
      'about': state.about.value,
      'SNILS': state.snils.value,
      'phone': state.phone.value,
      'socials': '',
      'email': state.email.value,
      'skills': state.skills
    });
    final data = jsonDecode(res.body);
    if (data['message'] == 'ok') {
      storage.save(AUTH_SAVE_KEY, data['token']);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  Future<User?> logIn({
    required String username,
    required String password,
  }) async {
    var res = await client.post(Uri.parse(api.baseUrl + '/auth'),
        headers: {'Content-Type': 'application/json'},
        body: {'email': username, 'password': password});
    final ans = jsonDecode(res.body);
    print(ans['message']);
    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['token'];
      await storage.save(AUTH_SAVE_KEY, token);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
