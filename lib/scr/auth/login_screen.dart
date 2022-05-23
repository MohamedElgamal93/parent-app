import 'dart:io';

import 'package:scostudent/data/model/response_model/login/login.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/scr/sco_bottom_bar/bottom_nav_screen.dart';
import 'package:scostudent/scr/widgets/center_progress_bar.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_utiles/sizes.dart';
import '../../data/api/error_data.dart';
import '../../data/model/response_model/login/login_request.dart';
import '../../notification/notification.dart';
import '../../presenter/login/login_presenter.dart';
import '../../presenter/login/login_presenter_interface.dart';
import '../view_interfaces/login_view_interface.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginViewInterface {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isFingerPrintLogin;
  bool? isFaceIDLogin;
  AppLocalizations? localizations;
  bool isPasswordVisible = false;
  bool _progressVisability = false;
  bool isFirstLogin = false;
  LoginPresenterInterface? _loginPresenterInterface;
  LoginRequest? _request;
  _LoginScreenState() {
    _loginPresenterInterface = LoginPresenter(this);
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: _loginUI(context),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: appGradientColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.height(
                                  context: context, pixels: 10)),
                          width:
                              SizeConfig.width(context: context, pixels: 265),
                          height:
                              SizeConfig.height(context: context, pixels: 150),
                          child: Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 70),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: fontTextmedium),
                                  )))),
                      SizedBox(
                        height: SizeConfig.height(context: context, pixels: 50),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height -
                            SizeConfig.height(context: context, pixels: 212),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(children: [
                          SizedBox(
                            height:
                                SizeConfig.height(context: context, pixels: 50),
                          ),
                          Image.asset(
                            "assets/images/login_logo.png",
                            height: SizeConfig.height(
                                context: context, pixels: 108),
                            width:
                                SizeConfig.width(context: context, pixels: 279),
                            fit: BoxFit.fill,
                          ),
                          Container(
                            height: 43,
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.height(
                                    context: context, pixels: 20),
                                top: SizeConfig.height(
                                    context: context, pixels: 70),
                                left: 20,
                                right: 20),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                hintText: localizations!.translate(UserEmail),
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: hintColorColor,
                                    fontFamily: fontTextRegular),
                                prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.height(
                                            context: context, pixels: 15)),
                                    child: Image.asset(
                                        "assets/images/userRegister.png",
                                        alignment: Alignment.center,
                                        color: iconsColor)),
                              ),
                            ),
                          ),
                          Container(
                            height:
                                SizeConfig.height(context: context, pixels: 43),
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.height(
                                    context: context, pixels: 20),
                                top: SizeConfig.height(
                                    context: context, pixels: 20),
                                left: SizeConfig.width(
                                    context: context, pixels: 20),
                                right: SizeConfig.width(
                                    context: context, pixels: 20)),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
                              controller: passwordController,
                              obscureText: !isPasswordVisible,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.width(
                                          context: context, pixels: 30)),
                                  hintText: localizations!.translate(PASSWORD),
                                  hintStyle: const TextStyle(
                                      fontSize: 18,
                                      color: hintColorColor,
                                      fontFamily: fontTextRegular),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    child: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.height(
                                            context: context, pixels: 15)),
                                    child: Image.asset(
                                        "assets/images/lockRegister.png",
                                        alignment: Alignment.center,
                                        color: iconsColor),
                                  )),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                doLogin(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.height(
                                        context: context, pixels: 70),
                                    left: SizeConfig.width(
                                        context: context, pixels: 40),
                                    right: SizeConfig.width(
                                        context: context, pixels: 40)),
                                width: MediaQuery.of(context).size.width,
                                height: SizeConfig.height(
                                    context: context, pixels: 50),
                                decoration: BoxDecoration(
                                  color: containerColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: SizeConfig.width(
                                            context: context, pixels: 60)),
                                    Spacer(),
                                    Center(
                                        child: Text(
                                      localizations!.translate(LOGIN),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: fontTextmedium),
                                    )),
                                    Spacer(),
                                    AppLocalizations.instance!.locale
                                                .languageCode ==
                                            englishLanguageCode
                                        ? Image.asset(
                                            "assets/images/arrow_forward.png")
                                        : Image.asset(
                                            "assets/images/arrow_arabic.png"),
                                    SizedBox(
                                      width: SizeConfig.width(
                                          context: context, pixels: 30),
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.height(
                                      context: context, pixels: 20)),
                              child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    localizations!.translate(forgotPassword),
                                    style: const TextStyle(
                                        color: loginColor,
                                        fontSize: 16,
                                        fontFamily: fontTextmedium),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.height(
                                      context: context, pixels: 20)),
                              child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    localizations!.translate(signUp),
                                    style: const TextStyle(
                                        color: loginColor,
                                        fontSize: 16,
                                        fontFamily: fontTextmedium),
                                  ))),
                        ]),
                      )
                    ],
                  ),
                  CenterCircularProgressbar(
                      submitProgressVisbility: _progressVisability),
                ],
              ),
            )));
  }

  doLogin(context) async {
    FocusScope.of(context).unfocus();

    _request = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fcmToken: PushNotification.token,
      fcmType: Platform.isAndroid ? "android" : "ios",
    );
    dynamic pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (emailController.text != "" && !regex.hasMatch(emailController.text)) {
      Widget okButton = TextButton(
        child: Text(
          localizations!.translate(AGREE),
        ),
        onPressed: () => Navigator.pop(context),
      );

      AlertDialog alert = AlertDialog(
        title: Text(
          localizations!.translate(ATTENSION),
        ),
        content: Text(
          localizations!.translate(PleaseFillEmailincorrectform),
        ),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else if (passwordController.text != "" &&
        emailController.text != "" &&
        regex.hasMatch(emailController.text)) {
      setState(() {
        _progressVisability = true;
      });
      _loginPresenterInterface!.login(_request!);
    } else if (emailController.text == "" || passwordController.text == "") {
      Widget okButton = TextButton(
        child: Text(
          localizations!.translate(AGREE),
        ),
        onPressed: () => Navigator.pop(context),
      );

      AlertDialog alert = AlertDialog(
        title: Text(
          localizations!.translate(ATTENSION),
        ),
        content: Text(
          localizations!.translate(PLEASE_FILL_ALL_DATA),
        ),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Farah,
          content: Text(
            localizations!.translate(PLEASE_FILL_YOUR_NUMBER),
          )));
    }
  }

  Future callLoginApi(String userName) async {
    setState(() {
      _progressVisability = true;
    });
  }

  showAlertDialog(BuildContext context, String errorMessage) {
    Widget okButton = TextButton(
      child: Text(
        localizations!.translate(AGREE),
      ),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        localizations!.translate(ATTENSION),
      ),
      content: Text(
        errorMessage,
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Future<void> onLoadDataComplete(Login loginResponse) async {
    setState(() {
      _progressVisability = false;
    });

    // getUser token
    getTokenOfUser(loginResponse);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(IS_LOGIN, true);
    prefs.setString("user_name", "${loginResponse.data!.original!.user!.name}");

    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => const BottomNavScreen(),
            transitionsBuilder: (_, anim, __, child) => Container(child: child),
            transitionDuration: const Duration(seconds: 1)));
  }

  @override
  void onLoadDataError(ErrorResponse errorLogin) {
    print(" ${errorLogin.message} faiiiiiiled");

    if (mounted) {
      setState(() {
        _progressVisability = false;

        showAlertDialog(context, errorLogin.message);
        //  _uiInteraction = false;
      });
    }
  }

  Future<void> getTokenOfUser(Login loginResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_token", loginResponse.data!.original!.accessToken!);
  }
}

