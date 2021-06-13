part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    works = const [
      WorkExperience(name: '', position: 'position', responsibilities: [])
    ],
    education = const [
      Education(
        name: '',
        specialty: '',
        degree: '',
      )
    ],
    this.name = const Username.pure(),
    this.phone = const Username.pure(),
    this.photoUrl = const Username.pure(),
    this.about = const Username.pure(),
    this.skills = const [],
    this.snils = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  })  : works = works,
        education = education;

  final Email email;
  final Username name;
  final Password password;
  final Username phone;
  final Username photoUrl;
  final Username about;
  final List<String> skills;
  final Username snils;
  final List<WorkExperience> works;
  final List<Education> education;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith({
    Email? email,
    Username? username,
    Password? password,
    FormzStatus? status,
    Username? phone,
    Username? photoUrl,
    Username? about,
    List<String>? skills,
    Username? snils,
    List<WorkExperience>? works,
    List<Education>? education,
  }) {
    return LoginState(
        name: username ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        phone: phone ?? this.phone,
        photoUrl: photoUrl ?? this.photoUrl,
        about: about ?? this.about,
        skills: skills ?? this.skills,
        snils: snils ?? this.snils,
        works: works ?? this.works,
        education: education ?? this.education);
  }
}
