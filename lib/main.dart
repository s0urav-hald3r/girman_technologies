import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girman/app.dart';

Future<void> main() async {
  // ! Add Widgets Binding
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // ! Await Native Splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ! Fixed Portrait Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());

  // ! Remove Native Splash
  // FlutterNativeSplash.remove();
}
