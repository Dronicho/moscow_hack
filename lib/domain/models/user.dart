import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/work_experience.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  @JsonSerializable(includeIfNull: true)
  const factory User(
      {required String id,
      required String fio,
      required String email,
      required List<String> skills,
      String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      List<WorkExperience?>? work,
      List<Education?>? education}) = _User;

  static const empty = const User(
      id: '213',
      fio: 'Test',
      email: 'a@a.ru',
      skills: ['Docker', 'Pocker', 'Mobile']);

  String get name => fio;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserType { stuff, coach }
