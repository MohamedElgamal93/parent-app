import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scostudent/data/local_cache.dart';
import 'package:scostudent/scr/auth/profileLoginSuccess.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import '../../app_utiles/app_utils.dart';
import '../../bussniess_logic/localization_cubit/localization_cubit.dart';
import '../../lang/AppLanguage.dart';

class ProfilescostudentScreen extends StatefulWidget {
  const ProfilescostudentScreen({Key? key}) : super(key: key);

  @override
  _ProfilescostudentScreenState createState() =>
      _ProfilescostudentScreenState();
}

class _ProfilescostudentScreenState extends State<ProfilescostudentScreen> {
  String? urlAboutUse;
  @override
  void initState() {
    super.initState();

  }
   @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }
  
    int _groupValue = 1;
  bool obscureText = true;
  bool userChanged = false;
  int? choice;

  bool canProceed = false;
    AppLocalizations? localizations;

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:
          CustomScrollView(physics: ClampingScrollPhysics(), slivers: <Widget>[
        _loginUI(screenHeight),
      ]),
    );
  }

  SliverToBoxAdapter _loginUI(screenHeight) {
    return SliverToBoxAdapter(
        child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(afrah_LOGIN_LOGOOO),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 80),
      child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButtonUser(context),
                const Padding(padding: EdgeInsets.all(0.0), child: Divider()),
                _buildButtonSetting(context),
                const Padding(padding: EdgeInsets.all(0.0), child: Divider()),
                const SizedBox(
                  height: 5,
                ),
                _buttonBack(),
                _socialMeadia()
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Container _buildButtonUser(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => ProfileLoginSuccess(),
                transitionsBuilder: (_, anim, __, child) =>
                    Container(child: child),
                transitionDuration: Duration(seconds: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Image.asset("assets/profileOne.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: Text(
                  AppLocalizations.of(context)!.translate(PERSONPROFILE),
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: afrah_MEDIUM_FONT,
                      color: Frah_Black)),
            ),
          ],
        ),
      ),
    );
  }

 
  Container _buildButtonSetting(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              child: Container(
                height: 210.0,
                width: 150.0,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate(CHANGE_LANGUAGE),
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            fontFamily: afrah_BOLD_FONT),
                      ),
                    ),
                    SizedBox(height: 20),
                    _radioButtons(
                        AppLocalizations.of(context)!
                            .translate(FRENCH_LANGUAGE),
                        2),
                    _radioButtons(
                        AppLocalizations.of(context)!
                            .translate(ENGLISH_LANGUAGE),
                        1),
                  ],
                ),
              ),
            );
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: new Image.asset("assets/profileThree.png"),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: new Text(AppLocalizations.of(context)!.translate(SETTING),
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: afrah_MEDIUM_FONT,
                      color: Frah_Black)),
            )
          ],
        ),
      ),
    );
  }



  Container _radioButtons(String title, int value) {
    if (Localizations.localeOf(context).languageCode == englishLanguageCode) {
      _groupValue = 1;
    } else if (  Localizations.localeOf(context).languageCode == arabicLanguageCode
) {
      _groupValue = 2;
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Radio(
                  value: value,
                  groupValue: _groupValue,
                  onChanged: (int? v) => _radioOnChange(v!),
                  activeColor: Colors.red,
                )),
            Positioned(
              top: 12,
              left: 40,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: afrah_MEDIUM_FONT,
                  color: BLACK,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ));
  }

  void _radioOnChange(int value) {
    setState(() {
      _groupValue = value;

      switch (value) {
        case 1:
          choice = value;
          break;
        case 2:
          choice = value;
          break;
        default:
          choice = null;
      }
      logD(choice!);
    });

    logD(value);
    if (value == 1) {
      setState(() {
        canProceed = true;
      });
      // setState(() {
      //   appLanguage!.changeLanguage(Locale('en'));
      // });
              LocalCache localCache = LocalCache();
                Locale newLocale = const Locale(englishLanguageCode, "");
                AppLocalizations.instance!.seLocal = newLocale;
                localCache.saveBool(isFirstRunKey, true);
                BlocProvider.of<LocalizationCubit>(context)
                    .setLocale(newLocale);
                localCache.save(languageKey, englishLanguageCode);

      Navigator.pop(context, true);
    } else if (value == 2) {
      setState(() {
        canProceed = false;
      });
      // setState(() {
      //   appLanguage!.changeLanguage(Locale('ar'));
      // });
         LocalCache localCache = LocalCache();
                localCache.saveBool(isFirstRunKey, true);
                Locale newLocale = const Locale(arabicLanguageCode, "");
                AppLocalizations.instance!.seLocal = newLocale;
                BlocProvider.of<LocalizationCubit>(context)
                    .setLocale(newLocale);
                localCache.save(languageKey, arabicLanguageCode);
      Navigator.pop(context, true);
    }
  }



  _buttonBack() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(
          margin: const EdgeInsets.only(right: 15),
          child: Text(
            AppLocalizations.of(context)!.translate(VISIT_US),
            style: const TextStyle(
                fontSize: 15, fontFamily: afrah_MEDIUM_FONT, color: Frah_Black),
          )),
    ]);
  }

  _socialMeadia() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: FarahFour,
                    image: DecorationImage(
                        image: AssetImage("assets/instegram.png"),
                        fit: BoxFit.cover),
                  )),
              onTap: () async {
                print("instegram");

                const url = "https://www.instagram.com";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Could not launch $url";
                }
              }),
          const SizedBox(width: 10),
          GestureDetector(
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: FarahFour,
                    image: DecorationImage(
                        image: AssetImage("assets/twitter.png"),
                        fit: BoxFit.cover),
                  )),
              onTap: () async {
                print("twitter");

                const url = "https://www.twitter.com";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Could not launch $url";
                }
              }),
          const SizedBox(
            width: 13,
          ),
          GestureDetector(
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: FarahFour,
                    image: DecorationImage(
                        image: AssetImage("assets/facebook.png"),
                        fit: BoxFit.cover),
                  )),
              onTap: () async {
                print("face book");

                const url = "https://www.facebook.com/";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Could not launch $url";
                }
              }),
        ]);
  }


}
