import 'package:animated_splash_screen/animated_splash_screen.dart'
    show AnimatedSplashScreen, SplashTransition;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:handsforhunger/donor.dart';
import 'package:handsforhunger/verifyEmail.dart';
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
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.grey[500],
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Hands For Hunger',
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200,
          splash: Container(
            child: Image(
              image: splash,
            ),
          ),
          duration: 2000,
          nextScreen: Verify()),
    );
  }
}
