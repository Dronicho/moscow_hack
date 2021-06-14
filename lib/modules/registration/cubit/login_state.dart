part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required User user,
    required String password,
    @Default(false) bool loading,

  }) = _LoginState;
}
