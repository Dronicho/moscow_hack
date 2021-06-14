import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/domain/models/work_experience.dart';
import 'package:moscow/domain/repositories/repositories.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository)
      : super(LoginState(
            password: '',
            loading: false,
            user: User(
              education: [
                Education(
                    name: '',
                    specialty: '',
                    degree: 'Бакалавр',
                    dateEnd: DateTime.now(),
                    dateStart: DateTime.now())
              ],
              work: [
                WorkExperience(
                    name: '',
                    position: '',
                    responsibilities: '',
                    dateEnd: DateTime.now(),
                    dateStart: DateTime.now())
              ],
              skills: [],
              fio: '',
              stats: UserStats.empty,
              id: '',
              email: '',
            )));

  final AuthenticationRepository _authenticationRepository;

  void userChanged(User user) {
    emit(state.copyWith(user: user));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> register() async {
    emit(state.copyWith(loading: true));
    try {
      await _authenticationRepository.register(state);
    } catch (error) {
      print(error);
    }
    emit(state.copyWith(loading: false));
  }
}
