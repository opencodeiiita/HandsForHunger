import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'welcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage splash = AssetImage('images/appIcon.png');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hands For Hunger',
      home: AnimatedSplashScreen(
          splash: Image(image: splash),
          duration: 3000,
          nextScreen: WelcomeScreen()),
    );
  }
}
