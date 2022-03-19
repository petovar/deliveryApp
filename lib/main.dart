import 'package:flutter/material.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/splah/splash_screen.dart';
import 'package:theme_and_clean_architecture_state_management/presentation/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme, //lightTheme
      home: const SplashScreen(),
    );
  }
}
