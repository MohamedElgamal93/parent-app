import 'package:scostudent/text_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scostudent/app_constants.dart';

void logD(Object o) {
  assert(() {
    print(o);
    return true;
  }());
}

setOrNotSetLoginSharedPreference(bool bol) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(IS_LOGIN, bol);
}

Future<bool?> getLoginSharedPreference(bool? value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  value = prefs.getBool(IS_LOGIN)!;
  print("$value loginnnnnn success");
  return prefs.getBool(IS_LOGIN);
}

saveFingerPrintLogin(bool bol) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("fingerprint_login", bol);
}

Future<bool?> reteriveFingerPrintLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("fingerprint_login");
}

saveFaceIdLogin(bool bol) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("face_id", bol);
}

Future<bool?> reteriveFaceIDLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("face_id");
}

Future<void> showInfoDialog(BuildContext context, String positiveMessage,
    String title, String body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          TextButton(
            child: Text(positiveMessage),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showLogoutDialog(BuildContext context, String positiveMessage,
    String negativeMessage, String title, String body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          TextButton(
            child: Text(positiveMessage),
            onPressed: () {
              Navigator.of(context).pop();
              logout(context);
            },
          ),
          TextButton(
            child: Text(negativeMessage),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(IS_LOGIN, false);
  Navigator.pushReplacementNamed(context, LOGIN_ROUT);
}

void showToast(GlobalKey<ScaffoldState> scaffoldKey, message) {
  scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(
    message,
    textAlign: TextAlign.center,
    style: TextStyleBuilder.getTextStyle(
        fontFamily:
            isArabicString(message) ? afrah_MEDIUM_FONT : afrah_BOLD_FONT),
  )));
}

bool isArabicString(String word) {
  RegExp pattern = RegExp("[ء-ي]+", caseSensitive: false);
  return pattern.hasMatch(word);
}
