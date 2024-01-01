import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:youapp_test/dependencies_injection.dart';
import 'package:youapp_test/lzyct_app.dart';
import 'package:youapp_test/utils/utils.dart';

Future main() async {
  // Load .env
  await dotenv.load(fileName: ".env");

  runZonedGuarded(
    /// Lock device orientation to portrait
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Register Service locator
      await serviceLocator();

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then((_) => runApp(LzyctApp()));
    },
    (error, stackTrace) async {
      print("error: $error, stacktrace: $stackTrace");
    },
  );
}
