import 'package:flutter/material.dart';
import '../constants/appcolors.dart';
import '../constants/appfonts.dart';

class Day4 extends StatefulWidget {
  const Day4({super.key});

  @override
  State<Day4> createState() => _Day4State();
}

class _Day4State extends State<Day4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 4'),
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
