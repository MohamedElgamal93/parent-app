import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scostudent/app_utiles/sizes.dart';
import 'package:scostudent/data/local_cache.dart';
import 'package:scostudent/app_constants.dart';
import '../../bussniess_logic/localization_cubit/localization_cubit.dart';
import '../../lang/AppLocalizations.dart';
import '../auth/login_screen.dart';
import '/../app_constants.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late AppLocalizations localizations;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        resizeToAvoidBottomInset: true,
        body: _languageUI(context),
      ),
    );
  }

  Widget _languageUI(BuildContext context) {
    return SingleChildScrollView(
 child:
        
        Container(color:Colors.white,child:
         Container(
            decoration: BoxDecoration(
              gradient: appGradientColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.height(context: context, pixels: 10)),
                  width: SizeConfig.width(context: context, pixels: 265),
                  height: SizeConfig.height(context: context, pixels: 235),
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(languageLogo))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      SizeConfig.height(context: context, pixels: 246),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 40),
                        ),
                        Image.asset(
                          "assets/images/language_second_logo.png",
                          height:
                              SizeConfig.height(context: context, pixels: 85),
                          width:
                              SizeConfig.width(context: context, pixels: 219),
                          fit: BoxFit.fill,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child:
                               Directionality(textDirection: TextDirection.ltr, child: 
                             Text("اختر اللغة",
                                style: TextStyle(
                                    color: wordsBlackColor,
                                    fontSize: 20.0,
                                    fontFamily: fontTextRegular,
                                    fontWeight: FontWeight.w500)))),
                        const Padding(
                            padding: EdgeInsets.only(top: 13),
                            child:
                            Directionality(textDirection: TextDirection.ltr, child: 
                            
                             Text("Select Language",
                                style: TextStyle(
                                    color: wordsBlackColor,
                                    fontSize: 20.0,
                                    fontFamily: fontTextmedium,
                                    fontWeight: FontWeight.w500)))),
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.height(
                                  context: context, pixels: 25),
                              left: SizeConfig.width(
                                  context: context, pixels: 30),
                              right: SizeConfig.width(
                                  context: context, pixels: 30)),
                          child: InkWell(
                            child: Column(
                              children: [
                                SizedBox(
                                  
                                  height: 45,
                                  child:
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Center(
                                              child: Text(
                                            localizations.translate(arlanguage),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: AppLocalizations
                                                                .instance!
                                                                .locale
                                                                .languageCode ==
                                                            arabicLanguageCode
                                                        ? Colors.black
                                                        : Colors.grey),
                                            textAlign: TextAlign.center,
                                          ))),
                                      AppLocalizations.instance!.locale
                                                  .languageCode ==
                                              arabicLanguageCode
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig.width(
                                                      context: context,
                                                      pixels: 25),
                                                  vertical: SizeConfig.height(
                                                      context: context,
                                                      pixels: 10)),
                                              child: Image.asset(
                                                  "assets/images/checked.png"),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig.width(
                                                      context: context,
                                                      pixels: 25),
                                                  vertical: SizeConfig.height(
                                                      context: context,
                                                      pixels: 10)),
                                              child: Image.asset(
                                                  "assets/images/non_checked.png"),
                                            )
                                    ])),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 2,
                                  color: bordrsColor,
                                )
                              ],
                            ),
                            onTap: () {
                              LocalCache localCache = LocalCache();
                              localCache.saveBool(isFirstRunKey, true);
                              Locale newLocale =
                                  const Locale(arabicLanguageCode, "");
                              AppLocalizations.instance!.seLocal = newLocale;
                              BlocProvider.of<LocalizationCubit>(context)
                                  .setLocale(newLocale);
                              localCache.save(languageKey, arabicLanguageCode);
                            },
                          ),
                        ),
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 22),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.width(
                                  context: context, pixels: 30),
                              right: SizeConfig.width(
                                  context: context, pixels: 30)),
                          child: InkWell(
                            child: Column(
                              children: [
                                SizedBox(
                                  
                                  height: 45,
                                  child:
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Center(
                                              child: Text(
                                            localizations.translate(language),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: AppLocalizations
                                                                .instance!
                                                                .locale
                                                                .languageCode ==
                                                            englishLanguageCode
                                                        ? Colors.black
                                                        : Colors.grey),
                                            textAlign: TextAlign.center,
                                          ))),
                                      AppLocalizations.instance!.locale
                                                  .languageCode ==
                                              englishLanguageCode
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig.width(
                                                      context: context,
                                                      pixels: 25),
                                                  vertical: SizeConfig.height(
                                                      context: context,
                                                      pixels: 5)),
                                              child: Image.asset(
                                                  "assets/images/checked.png"),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig.width(
                                                      context: context,
                                                      pixels: 25),
                                                  vertical: SizeConfig.height(
                                                      context: context,
                                                      pixels: 10)),
                                              child: Image.asset(
                                                  "assets/images/non_checked.png"),
                                            )
                                    ])),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 2,
                                  color: bordrsColor,
                                )
                              ],
                            ),
                            onTap: () async {
                              LocalCache localCache = LocalCache();
                              Locale newLocale =
                                  const Locale(englishLanguageCode, "");
                              AppLocalizations.instance!.seLocal = newLocale;
                              localCache.saveBool(isFirstRunKey, true);
                              BlocProvider.of<LocalizationCubit>(context)
                                  .setLocale(newLocale);
                              localCache.save(languageKey, englishLanguageCode);
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.width(
                                    context: context, pixels: 40),
                                right: SizeConfig.width(
                                    context: context, pixels: 40),
                                top: SizeConfig.height(
                                    context: context, pixels: 90)),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              LoginScreen(),
                                          transitionsBuilder:
                                              (_, anim, __, child) =>
                                                  Container(child: child),
                                          transitionDuration:
                                              Duration(seconds: 1)));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                          localizations.translate(confirm),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontFamily: fontTextmedium,
                                              fontWeight: FontWeight.w500))),
                                )))
                      ]),
                )
              ],
            ))));
  }
}
