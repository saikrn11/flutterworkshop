import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final Color bgColor;
  final double height;
  final Widget child;
  final double minWidth;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    this.height = 45,
    required this.child,
    this.minWidth = .2,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      color: bgColor,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      shape: const StadiumBorder(),
      minWidth: size.width * minWidth,
      height: height,
      child: child,
    );
  }
}
