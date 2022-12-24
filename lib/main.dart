import 'package:animated_splash_screen/animated_splash_screen.dart' show AnimatedSplashScreen, SplashTransition;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:handsforhunger/logIn.dart';
import 'welcomeScreen.dart';
import 'package:lottie/lottie.dart';


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
          
          
          splash: SafeArea(
            child: Lottie.asset('images/donate.json', height: 300, width: 300),
          ),
          splashIconSize: 250,
          duration: 3000,
          nextScreen: WelcomeScreen()),
    );
  }
}
