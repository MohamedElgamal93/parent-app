import 'package:flutter/material.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/text_Style.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scostudent/app_utiles/app_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

final themeColor = Color(0xfff5a623);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);

class ProfileLoginSuccess extends StatefulWidget {
  @override
  __ProfileLoginSuccessextends createState() => __ProfileLoginSuccessextends();
}

class __ProfileLoginSuccessextends extends State<ProfileLoginSuccess> {
  bool isSwitchedFT = false;
  bool? value;
  TextEditingController? controllerNickname;
  TextEditingController? controllerAboutMe;

  SharedPreferences? prefs;

  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';

  bool isLoading = false;

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>[
              _profilUI(screenHeight),
            ]),
      ),
    );
  }

  SliverToBoxAdapter _profilUI(screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(afrah_LOGIN_LOGOOO),
            fit: BoxFit.cover,
          ),
        ),
        padding:
            const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 80),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfleImageUseNameNumberContainer(),
                  _buildButtonNotification(context),
                  _buildButtonEgypt(context),
                  _buildButtonLogOut(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildProfleImageUseNameNumberContainer() {
    return Container(
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Container(
            child: Center(
              child: Stack(
                children: <Widget>[
                  Material(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                        width: 90.0,
                        height: 90.0,
                        padding: const EdgeInsets.all(20.0),
                      ),
                      imageUrl: photoUrl,
                      width: 90.0,
                      height: 90.0,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(45.0)),
                    clipBehavior: Clip.hardEdge,
                  ),
                  Image.asset("assets/manImage.png"),
                ],
              ),
            ),
            width: double.infinity,
            margin: const EdgeInsets.all(20.0),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "JON",
            style: const TextStyle(
                fontSize: 24, fontFamily: afrah_BOLD_FONT, color: Farah),
          ),
          const SizedBox(
            height: 0,
          ),
        
        ]));
  }

  Container _buildButtonNotification(BuildContext context) {
    return Container(
      height: 48,

      margin: const EdgeInsets.only(right: 17, left: 17),
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            child: Image.asset("assets/Bell.png", color: FarahPhoneColor),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(AppLocalizations.of(context)!.translate(NOTIFICATION),
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: afrah_BOLD_FONT,
                    color: FarahPhoneColor)),
          ),
          const Spacer(flex: 1),
          Switch(
            value: isSwitchedFT,
            onChanged: (bool value) {
              setState(() {
                isSwitchedFT = value;

                print('Saved state is $isSwitchedFT');
                //switch works
              });
              print(isSwitchedFT);
              if (isSwitchedFT == false) {
                print("false");
              }
            },
            activeTrackColor: FarahColorSecond,
            activeColor: Colors.white,
          ),
        ],
      ),

      //   ),
    );
  }

  Container _buildButtonEgypt(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(right: 17, left: 17),
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Image.asset("assets/Earth.png", color: FarahPhoneColor),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(AppLocalizations.of(context)!.translate(EGYPT),
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: afrah_BOLD_FONT,
                    color: FarahPhoneColor)),
          ),
        ],
      ),

      //    ),
    );
  }

  Container _buildButtonLogOut(BuildContext context) {
    return Container(
      height: 48,
      // alignment: FractionalOffset.center,
      margin: const EdgeInsets.only(right: 12, left: 12),
      width: double.infinity,

      child: TextButton(
        onPressed: () => showLogoutDialog(
            context,
            AppLocalizations.of(context)!.translate(AGREE),
            AppLocalizations.of(context)!.translate(CANACEL),
            AppLocalizations.of(context)!.translate(ATTENSION),
            AppLocalizations.of(context)!
                .translate(ARE_YOU_SURE_YOU_WANT_TO_LOG_OUT)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Image.asset("assets/Logout.png", color: FarahPhoneColor),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: Text(AppLocalizations.of(context)!.translate(LOG_OUT),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: afrah_BOLD_FONT,
                      color: FarahPhoneColor)),
            ),
          ],
        ),
      ),
    );
  }
}
