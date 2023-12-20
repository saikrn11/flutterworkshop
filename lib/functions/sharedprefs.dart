
import 'package:flutter/material.dart';
import 'package:flutterworkshop/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShareData {
  username({
    required String val,
    required String type,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == 'put') {
      await prefs.setString('user_name', val);
    } else {
      return prefs.getString('user_name') ?? "";
    }
  }

logOut(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    );
  }

}
