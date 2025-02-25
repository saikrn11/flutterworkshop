import 'package:flutter/material.dart';
import '../constants/apptheme.dart';
import '../screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(context),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
