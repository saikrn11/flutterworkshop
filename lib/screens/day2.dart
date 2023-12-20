import 'package:flutter/material.dart';
import 'package:flutterworkshop/constants/appcolors.dart';
import 'package:flutterworkshop/constants/appfonts.dart';

class Day2 extends StatefulWidget {
  const Day2({super.key});

  @override
  State<Day2> createState() => _Day2State();
}

class _Day2State extends State<Day2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 2'),
      ),
      body: Center(
        child: Text(
          'Under Construction!....',
          style: Fonts()
              .h3l(context)
              .copyWith(color: black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
