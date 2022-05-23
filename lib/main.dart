import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scostudent/scr/onboading_scr/language_Page.dart';
import 'package:scostudent/scr/onboading_scr/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/scr/auth/login_screen.dart';
import 'package:scostudent/scr/onboading_scr/onboarding_Page.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scostudent/scr/sco_bottom_bar/bottom_nav_screen.dart';
import 'bussniess_logic/localization_cubit/localization_cubit.dart';
import 'dependency_injection.dart';
import 'package:scostudent/dependency_injection.dart';
import 'dart:async';

import 'notification/notification.dart';
import 'package:scostudent/crashlytics/crashlytics_handler.dart';


void main() async {
  runZonedGuarded<Future<void>>(
    () async {
        Injector.configure(Flavor.PROD);
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      PushNotification().init();
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      CrashlyticsHandler.instance();
      // catch all errors that are thrown within the Flutter framework.
      FlutterError.onError =
          CrashlyticsHandler.instance().crashlytics.recordFlutterError;

      runApp( MyApp());
    },
    (error, stack) =>
        CrashlyticsHandler.instance().crashlytics.recordError(error, stack),
  );
}
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class MyApp extends StatefulWidget {
  MyApp();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: FarahThree));

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocalizationCubit()..getLocale()),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            locale: state.mainLocale,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocaleLanguage in supportedLocales) {
                if (supportedLocaleLanguage.languageCode ==
                        locale!.languageCode &&
                    supportedLocaleLanguage.countryCode == locale.countryCode) {
                  return supportedLocaleLanguage;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: const [
                Locale('en', ''), // English, no country code
              Locale('ar', ''), // Arabic, no country code
            
            ],
            debugShowCheckedModeBanner: false,
            title: TIMESHEET,
            initialRoute: SPLASH_ROUT,
            routes: <String, WidgetBuilder>{
              ONBOARDING_ROUT: (BuildContext context) => OnBoardingPage(),
              LOGIN_ROUT: (BuildContext context) => LoginScreen(),
              SPLASH_ROUT: (BuildContext context) => SplashScreen(),
              HOME_ROUT: (BuildContext context) => const BottomNavScreen(),
              Language_ROUT: (BuildContext context) =>  LanguageScreen(),
            },
            theme: ThemeData(
              primaryColor: appColor,
              primarySwatch: Colors.red,
              cupertinoOverrideTheme:
                  const CupertinoThemeData(primaryColor: appColor),
            ),
          );
        }));
  }
}
