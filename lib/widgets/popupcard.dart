import 'package:flutter/material.dart';

import '../constants/appcolors.dart';
import '../constants/appfonts.dart';
import '../screens/splashscreen.dart';

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
    barrierDismissible: false, // Set to false initially
    barrierLabel: '',
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionDuration: const Duration(
      milliseconds: 150,
    ),
    transitionBuilder: (ctx, a1, a2, child) {
      return WillPopScope(
        onWillPop: () async {
          if (dismiss) {
            // If dismiss is allowed, directly close the popup
            return true;
          } else {
            // If dismiss is not allowed, show a confirmation dialog
            return await showExitConfirmationDialog(context);
          }
        },
        child: AlertDialog(
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
        ),
      );
    },
  );
}

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Return false to not exit
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              ); // Return true to exit
            },
            child: const Text('Exit'),
          ),
        ],
      );
    },
  );
}
