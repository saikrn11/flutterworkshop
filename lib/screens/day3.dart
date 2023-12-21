import 'package:flutter/material.dart';
import '../constants/appcolors.dart';
import '../constants/appfonts.dart';

class Day3 extends StatefulWidget {
  const Day3({super.key});

  @override
  State<Day3> createState() => _Day3State();
}

class _Day3State extends State<Day3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 3'),
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
