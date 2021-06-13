import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/repositories/user.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  void updateUser(User user, [bool update = true]) {
    if (update) UserRepository().updateUser(user);
    emit(AppState(user: user));
  }
}

class AppState extends Equatable {
  const AppState({this.user = User.empty});

  final User user;

  @override
  List<Object?> get props => [user];
}
