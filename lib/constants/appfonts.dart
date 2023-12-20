

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  TextStyle title(context) {
    return GoogleFonts.dancingScript(
        textStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontWeight: FontWeight.w600));
  }

  TextStyle titlemed(context) {
    return GoogleFonts.dancingScript(
        textStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontWeight: FontWeight.w600));
  }

  TextStyle titlesmall(context) {
    return GoogleFonts.dancingScript(
        textStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(fontWeight: FontWeight.w600));
  }

  TextStyle logo(context) {
    return GoogleFonts.varelaRound(
        textStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600));
  }

  TextStyle h1l(context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith();
  }

  TextStyle h1m(context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith();
  }

  TextStyle h1s(context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith();
  }

  TextStyle h2l(context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith();
  }

  TextStyle h2m(context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith();
  }

  TextStyle h2s(context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith();
  }

  TextStyle h3l(context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith();
  }

  TextStyle h3m(context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith();
  }

  TextStyle h3s(context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith();
  }

  TextStyle h4l(context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith();
  }

  TextStyle h4m(context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith();
  }

  TextStyle h4s(context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith();
  }
}
