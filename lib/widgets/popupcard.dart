import 'package:flutter/material.dart';
import 'package:flutterworkshop/constants/appfonts.dart';

import '../constants/appcolors.dart';


Future popupCard({
  required BuildContext context,
  Color? barrierColor,
  Color? bgColor,
  Widget? content,
  Widget? title,
  List<Widget>? actions,
  bool dismiss = false,
  GlobalKey? widgetKey,
}) {
  return showGeneralDialog(
    context: context,
    barrierColor: barrierColor == null
        ? black.withAlpha(150)
        : barrierColor.withAlpha(150),
    barrierDismissible: dismiss,
    barrierLabel: '',
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionDuration: const Duration(
      milliseconds: 150,
    ),
    transitionBuilder: (ctx, a1, a2, child) {
      if (widgetKey != null) {
      }
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: bgColor ?? white,
        title: title,
        titleTextStyle: Fonts().h3l(
          context,
        ),
        titlePadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        content: content,
        contentTextStyle: Fonts().h3m(
          context,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        actions: actions,
        actionsPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
      );
    },
  );
}
