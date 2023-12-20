import 'package:flutter/material.dart';
import 'package:flutterworkshop/constants/appcolors.dart';
import 'package:flutterworkshop/constants/appfonts.dart';

class Day1 extends StatefulWidget {
  const Day1({super.key});

  @override
  State<Day1> createState() => _Day1State();
}

class _Day1State extends State<Day1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 1'),
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
