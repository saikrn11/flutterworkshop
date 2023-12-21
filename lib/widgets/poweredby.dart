import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/appcolors.dart';
import '../constants/appfonts.dart';

class PoweredBy extends StatelessWidget {
  final GlobalKey? widgetKey;
  const PoweredBy({
    super.key,
    this.widgetKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse('https://www.teamup.ink/'));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50,
          ),
          gradient: const LinearGradient(
            colors: [
              white,
              lightGreen,
            ],
            stops: [
              .6,
              .9,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Powered by  ",
              style: Fonts().logo(context).copyWith(
                    color: grey,
                    fontSize: 10.0,
                  ),
            ),
            RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Team-",
                    style: Fonts().logo(context).copyWith(
                          color: black,
                          letterSpacing: 2.0,
                        ),
                  ),
                  TextSpan(
                    text: "Up!",
                    style: Fonts().logo(context).copyWith(
                          color: red,
                          letterSpacing: 2.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
