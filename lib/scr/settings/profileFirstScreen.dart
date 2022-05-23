import 'package:scostudent/scr/auth/registerScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/lang/AppLocalizations.dart';

class ProfileFirstScreen extends StatefulWidget {
  @override
  _ProfileFirstScreenState createState() => _ProfileFirstScreenState();
}

class _ProfileFirstScreenState extends State<ProfileFirstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loginUI(context),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(afrah_LOGIN_LOGOOO),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextContainer(context),
                SizedBox(
                  height: 10,
                ),
                _buildButtonContainer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTextContainer(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!
                  .translate(YOU_DONOT_REGISTER_WITH_US),
              style: TextStyle(
                fontSize: 23,
                fontFamily: afrah_BOLD_FONT,
                color: Farah,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              AppLocalizations.of(context)!.translate(PLEASE_REGISTER_FIRST),
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: afrah_MEDIUM_FONT,
                  color: FarahTextColor),
            ),
          ],
        )
      ]),
    );
  }

  Container _buildButtonContainer(BuildContext context) {
    return Container(
      height: 48,
      width: 179,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5).withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => RegiserScreenPage(),
                transitionsBuilder: (_, anim, __, child) =>
                    Container(child: child),
                transitionDuration: Duration(seconds: 1))),
        color: FarahColorSecond,
        textColor: Farah_WHITECOLOR,
        child: Text(
          AppLocalizations.of(context)!.translate(LOGIN_REGISTER),
          style: TextStyle(
              fontSize: 20,
              fontFamily: afrah_BOLD_FONT,
              color: Farah_WHITECOLOR),
        ),
      ),
    );
  }
}
