import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/app/app_locator.dart';
import 'features/onboarding/start_up/start_up.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Hive.initFlutter();
    setupLocator();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    locator.get<Logger>().e(e);
  }
  runApp(const Todo());
}
