import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:moscow/domain/models/work_experience.dart';
import 'package:moscow/domain/repositories/repositories.dart';
import 'package:moscow/modules/registration/models/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void skillsChanged(List<String> v) {
    emit(state.copyWith(
      skills: v,
      status: Formz.validate([state.password]),
    ));
  }

  void educationChanged(Education v) {
    emit(state.copyWith(
      education: [v],
      status: FormzStatus.invalid,
    ));
  }

  void workChanged(WorkExperience v) {
    emit(state.copyWith(
      works: [v],
      status: FormzStatus.invalid,
    ));
  }

  void snilsChanged(String v) {
    final value = Username.dirty(v);
    emit(state.copyWith(
      snils: value,
      status: Formz.validate([value, state.password]),
    ));
  }

  void aboutChanged(String v) {
    final value = Username.dirty(v);
    emit(state.copyWith(
      about: value,
      status: Formz.validate([value, state.password]),
    ));
  }

  void emailChanged(String v) {
    final value = Email.dirty(v);
    emit(state.copyWith(
      email: value,
      status: Formz.validate([value, state.password]),
    ));
  }

  void photoUrlChanged(String v) {
    final value = Username.dirty(v);
    emit(state.copyWith(
      photoUrl: value,
      status: Formz.validate([value, state.password]),
    ));
  }

  void phoneChanged(String v) {
    final value = Username.dirty(v);
    emit(state.copyWith(
      phone: value,
      status: Formz.validate([value, state.password]),
    ));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password, state.email]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> register() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.register(state);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      print(error);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logIn(
        username: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      print('123');
      print(error);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
