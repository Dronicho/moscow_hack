import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_experience.g.dart';
part 'work_experience.freezed.dart';

@freezed
class WorkExperience with _$WorkExperience {
  @JsonSerializable(includeIfNull: true)
  const factory WorkExperience(
      {@JsonKey(name: 'companyName') required String name,
      required String position,
      DateTime? dateStart,
      DateTime? dateEnd,
      required List<String> responsibilities}) = _WorkExperience;
  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);
}

@freezed
class Education with _$Education {
  @JsonSerializable(includeIfNull: true)
  const factory Education({
    required String name,
    required String specialty,
    required String degree,
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
