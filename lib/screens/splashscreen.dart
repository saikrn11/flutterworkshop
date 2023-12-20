import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterworkshop/constants/appcolors.dart';
import 'package:flutterworkshop/constants/appfonts.dart';
import 'package:flutterworkshop/constants/apptheme.dart';
import 'package:flutterworkshop/screens/homescreen.dart';
import 'package:flutterworkshop/widgets/poweredby.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize _animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation sequence
    _controller.forward();

    // Navigate to the next screen after the splash screen animation completes
    Timer(const Duration(seconds: 3), () {
      // Replace 'NextScreen()' with the screen you want to navigate to
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NextScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3EAF5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
 
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 100,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Flutter  Chapter',
                      style: Fonts()
                          .titlemed(context)
                          .copyWith(color: red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  void initState() {
   
    super.initState();

    Timer(const Duration(seconds: 2), () {
      // Replace 'NextScreen()' with the screen you want to navigate to
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFD3EAF5),
      body: Column(children: [
        const Spacer(),
         Center(
              child: Column(
                children: [
                   Image.asset('assets/logo.png',height: 100,width: 300,),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flutter Chapter',
                    style: Fonts()
                        .titlemed(context)
                        .copyWith(color: red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Spacer(),

            // Text: "Welcome to the Flutter Workshop"
             Text(
              "Welcome to the Flutter Workshop",
              style: Fonts().h3l(context).copyWith(fontWeight: FontWeight.bold,color: themecolor),
            ),
            const Spacer(),

            // Lottie Animation
            Lottie.asset(
              'assets/animation.json', // Replace with your Lottie animation file
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),

            const Spacer(),

            // Powered by TeamUP Container
            const PoweredBy(),
            const Spacer(),
      ],)
    );
  }
}
