import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import '../../constants.dart';
import 'storage.dart';

class ApiError implements Exception {}

class MissingCredentialsError implements Exception {}

class Api {
  late AuthenticatedHttpClient _client;
  final String baseUrl = 'https://21463b1e73fe.ngrok.io';
  AuthenticatedHttpClient get client => _client;

  Api() {
    _client = AuthenticatedHttpClient();
  }
}

class AuthenticatedHttpClient extends http.BaseClient {
  final _storage = GetIt.I<Storage>();

  AuthenticatedHttpClient();

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  String get userAccessToken {
    // use in memory token if available
    // if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  final _baseHeaders = {'Content-Type': 'application/json'};

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(url, headers: _baseHeaders..addAll(headers ?? {}));
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.post(url,
        headers: _baseHeaders..addAll(headers ?? {}),
        body: jsonEncode(body ?? null));
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.delete(url,
        headers: _baseHeaders..addAll(headers ?? {}),
        body: jsonEncode(body ?? null));
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.put(url,
        headers: _baseHeaders..addAll(headers ?? {}),
        body: jsonEncode(body ?? null));
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    print(userAccessToken);
    if (userAccessToken.isNotEmpty) {
      request.headers
          .putIfAbsent('Authorization', () => 'Bearer $userAccessToken');
    }
    return request.send();
  }

  String _loadTokenFromSharedPreference() {
    final token = _storage.get(AUTH_SAVE_KEY);
    return token ?? '';
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
