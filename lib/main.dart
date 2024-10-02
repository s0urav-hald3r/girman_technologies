import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:girman/app.dart';
import 'package:girman/firebase_options.dart';

Future<void> main() async {
  // ! Add Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // ! Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ! Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ! Fixed Portrait Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());

  // ! Remove Native Splash
  FlutterNativeSplash.remove();
}
