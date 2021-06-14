import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moscow/domain/models/sending_attachment.dart';
import 'package:moscow/domain/models/work_experience.dart';
import 'package:moscow/modules/start_team/widgets/add_project/add_project_view.dart';

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
      required UserStats stats,
      List<String>? requestedProjects,
      DateTime? createdAt,
      @JsonKey(name: 'photoURL') String? photoUrl,
      String? about,
      String? phone,
      String? socials,
      @JsonKey(name: 'SNILS') String? snils,
      @JsonKey(ignore: true) SendingAttachment? localImage,
      @Default(const []) @JsonKey(ignore: true) List<String> outgoingProjects,
      @JsonKey(name: 'workExperience') List<WorkExperience?>? work,
      List<Education?>? education}) = _User;

  static const empty = const User(
      stats: UserStats.empty,
      id: '213',
      fio: 'Test',
      email: 'a@a.ru',
      skills: ['Docker', 'Pocker', 'Mobile']);

  String get name => fio;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    required int friendly,
    required int competent,
    required int leadership,
  }) = _UserStats;

  static const empty =
      const UserStats(friendly: 0, competent: 0, leadership: 0);

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}

enum UserType { stuff, coach }
