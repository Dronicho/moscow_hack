import 'package:bloc/bloc.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/repositories/user.dart';

class UsersCubit extends Cubit<Map<String, User>> {
  UsersCubit(this._repository) : super({});

  UserRepository _repository;

  Future<User?> get(String id) async {
    if (state.containsKey(id)) {
      return state[id]!;
    } else {
      final user = await _repository.getUserById(id);
      if (user != null) {
        state[id] = user;
        return user;
      }
    }
  }
}
