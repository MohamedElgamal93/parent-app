import 'package:flutter/material.dart';
import 'package:scostudent/app_utiles/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scostudent/app_constants.dart';
import '../../lang/AppLocalizations.dart';
import '/../app_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLogin = false;
  late AppLocalizations localizations;

  @override
  void initState() {
    super.initState();
    getValueLogin();
  }


  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 80)),
                  width: MediaQuery.of(context).size.width -
                      SizeConfig.width(context: context, pixels: 60),
                  height: SizeConfig.height(context: context, pixels: 135),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/droid_logo.png"))),
                ),
                SizedBox(
                    height: SizeConfig.height(context: context, pixels: 30)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      SizeConfig.height(context: context, pixels: 245),
                  decoration: BoxDecoration(
                    gradient: appGradientColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: <
                          Widget>[
                    Image.asset(
                      mainLogo,
                      height: SizeConfig.height(context: context, pixels: 393),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: InkWell(
                            onTap: () {
                              if (isLogin == true) {
                                Navigator.popAndPushNamed(context, HOME_ROUT);
                              } else {
                                Navigator.popAndPushNamed(
                                    context, Language_ROUT);
                              }
                            },
                            child: Container(
                                width: SizeConfig.width(
                                    context: context, pixels: 201),
                                height: SizeConfig.height(
                                    context: context, pixels: 77),
                                decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: 
                                    
                             AppLocalizations.instance!.locale.languageCode ==
                                          englishLanguageCode?
                                    const BorderRadius.only(
                                        topLeft: Radius.circular(70.0),
                                        bottomRight: Radius.circular(25.0)):

                                         const BorderRadius.only(
                                      topRight  : Radius.circular(70.0),
                                       bottomLeft : Radius.circular(25.0))
                                        
                                        ),
                                child:  Center(
                                    child: Text(
                                      localizations.translate(getStarted),
                                    
                                        style: const TextStyle(
                                        color: wordsColor,
                                        fontFamily:fontTextmedium ,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500))))))
                  ]),
                )
              ],
            )));
  }

  getValueLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(IS_LOGIN)!;
  }
}
