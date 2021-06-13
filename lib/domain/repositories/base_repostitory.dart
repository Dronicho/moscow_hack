import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:moscow/domain/services/services.dart';

abstract class BaseRepository {
  final api = GetIt.I<Api>();
  final storage = GetIt.I<Storage>();

  Client get client => api.client;
}
