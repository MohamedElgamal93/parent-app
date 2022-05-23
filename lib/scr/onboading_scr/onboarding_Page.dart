import 'package:scostudent/scr/widgets/introduction_screen.dart';
import 'package:scostudent/scr/widgets/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import 'package:scostudent/lang/AppLanguage.dart';

import '../auth/login_screen.dart';

class OnBoardingPage extends StatefulWidget {

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  AppLocalizations? localizations;


   @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  void _onIntroEnd(context) {
          Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                         LoginScreen(),
                  transitionsBuilder: (_, anim, __, child) =>
                      Container(child: child),
                  transitionDuration: Duration(seconds: 1))); 
  _saveFirstLogin();

  }

      Widget _buildImage(String assetName) {
                 

       return Image.asset(assetName, fit: BoxFit.cover,);
                  }
                
                  @override
                  Widget build(BuildContext context) {
                  // appLanguage = Provider.of<AppLanguage>(context);
                    return WillPopScope(
                      onWillPop:_onWillPop,
                      child:
                      
                        Directionality( textDirection: TextDirection.ltr,
                      
               child:        IntroductionScreen(
                        globalBackgroundColor: BLACK,
                        key: introKey,
                        pages: [
                          PageViewModel(
                          bodyWidget:  
                          Localizations.localeOf(context).languageCode == arabicLanguageCode?

             _buildImage(F1) :Localizations.localeOf(context).languageCode ==  englishLanguageCode? _buildImage(F11):
           _buildImage(F1)
                          
                          ),
                          PageViewModel(
                           bodyWidget:
                           Localizations.localeOf(context).languageCode == arabicLanguageCode?
             _buildImage(F2) :Localizations.localeOf(context).languageCode ==  englishLanguageCode?  _buildImage(F22):
           _buildImage(F2)
                        
                          ),
                          PageViewModel(
                           bodyWidget: 
                                                                   Localizations.localeOf(context).languageCode == arabicLanguageCode?
             _buildImage(F3) : Localizations.localeOf(context).languageCode ==  englishLanguageCode?  _buildImage(F33):
           _buildImage(F3)
                      
                          ),
                      
                        ],
                        onDone: () => _onIntroEnd(context),
                        onSkip: () => _onIntroEnd(context),
                        showSkipButton: true,
                      //  isProgress:false,
                        skipFlex: 0,
                        nextFlex: 0,
                        skip: Text( localizations!.translate(SKIP), style: TextStyle(fontFamily: afrah_BOLD_FONT, color: Colors.white,fontSize: 26)),
                        next:  Text( localizations!.translate(NEXT), style: TextStyle(fontFamily: afrah_BOLD_FONT, color: Colors.white,fontSize: 26)),
                        done: Text( localizations!.translate(NEXT), style: TextStyle(fontFamily: afrah_BOLD_FONT, color: Colors.white,fontSize: 26))
                      ),
                        )
                    );
                  }
                
                  _saveFirstLogin() async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(FIRST_LOGIN, false);
                  }




                  Future<bool> _onWillPop() {
                          Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        pageBuilder: (_, __, ___) =>
                                                            LoginScreen(),
                                  transitionsBuilder: (_, anim, __, child) =>
                                      Container(child: child),
                                  transitionDuration: Duration(seconds: 1))); 
                    return Future(() => false);
                  }
                
              
                  
}