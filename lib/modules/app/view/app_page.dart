import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moscow/domain/blocs/authentication/authentication.dart';
import 'package:moscow/domain/blocs/users/bloc/users_bloc.dart';
import 'package:moscow/domain/repositories/repositories.dart';
import 'package:moscow/modules/app/bloc/app_cubit.dart';
import 'package:moscow/modules/app/bloc/loading_cubit.dart';
import 'package:moscow/modules/home/view/home_page.dart';
import 'package:moscow/modules/login/view/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moscow/widgets/image_loader.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: UserRepository()),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingCubit(),
      child: MaterialApp(
          supportedLocales: [
            Locale('en'),
            Locale('ru')
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Firs',
            primaryColor: Color(0xFF16FF00),
            backgroundColor: Color(0xffbbdefb),
          ),
          builder: (context, child) {
            return ImageLoader(
              child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => AppCubit(),
                    ),
                    BlocProvider(
                      create: (context) => UsersCubit(UserRepository()),
                    )
                  ],
                  child: BlocListener<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        switch (state.status) {
                          case AuthenticationStatus.authenticated:
                            context
                                .read<AppCubit>()
                                .updateUser(state.user, false);
                            _navigator.pushAndRemoveUntil<void>(
                              HomePage.route(),
                              (route) => false,
                            );
                            break;
                          case AuthenticationStatus.unauthenticated:
                            _navigator.pushAndRemoveUntil<void>(
                              LoginPage.route(),
                              (route) => false,
                            );
                            break;
                          default:
                            _navigator.pushAndRemoveUntil<void>(
                              LoginPage.route(),
                              (route) => false,
                            );
                            break;
                        }
                      },
                      child: child!)),
            );
          },
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))),
    );
  }
}
