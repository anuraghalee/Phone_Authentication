import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitterapp/firebase_options.dart';
import 'package:twitterapp/services/auth.dart';
import 'package:twitterapp/services/routes.dart';
import 'package:twitterapp/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    return MaterialApp(
      theme: appTheme,
      routes: appRoutes,
    );
  }
}
