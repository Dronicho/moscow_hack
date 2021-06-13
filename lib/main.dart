import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moscow/domain/services/messaging.dart';

import 'domain/repositories/repositories.dart';
import 'domain/services/services.dart';
import 'modules/app/view/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Jiffy.locale('ru');
  GetIt.I.registerSingleton(await Messaging().init());
  GetIt.I.registerSingleton(await Storage().init());
  GetIt.I.registerSingleton(FirebaseStorageService());
  GetIt.I.registerSingleton(Api());
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
  ));
}