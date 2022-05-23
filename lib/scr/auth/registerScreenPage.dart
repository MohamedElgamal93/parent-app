import 'package:scostudent/data/model/response_model/register/register.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/register/register_request.dart';
import 'package:scostudent/scr/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/scr/widgets/center_progress_bar.dart';
import 'package:scostudent/lang/AppLocalizations.dart';

import '../../presenter/register_presenter.dart';
import '../../presenter/register_presenter_interface.dart';
import '../view_interfaces/register_view_interface.dart';

class RegiserScreenPage extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegiserScreenPage> implements RegisterViewInterface{
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordNumberController = TextEditingController();
  TextEditingController _repasswordNumberController = TextEditingController();
    RegisterRequest? _request;
 Register? _ergister;
  RegisterPresenterInterface? _registerPresenterInterface;
  bool liked = false;
  
 
  _RegisterScreenState() {
    _registerPresenterInterface = RegisterPresenter(this);
  }
  //String _portTxt;

  bool? isFingerPrintLogin;
  bool? isFaceIDLogin;

  bool _progressVisability = false;

  bool hasFingerPrint = false;
  bool hasFaceID = false;
  bool isFirstLogin = false;

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _loginUI(context),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
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
                _buildLogoContainer(),
                const SizedBox(
                  height: 40,
                ),
                _buildUserNameContainer(),
                _buildOhoneNumberContainer(),
                _buildPasswordContainer(),
                _buildRepasswordContainer(),
                _buildButtonContainer(context),
                _bottomScreen()
              ],
            ),
          ),
          CenterCircularProgressbar(
              submitProgressVisbility: _progressVisability),
        ],
      ),
    ));
  }

  Container _buildLogoContainer() {
    return Container(
      child: Image.asset(
        afrah_LOGIN_LOGO,
        //   width: 158,
        //height: 114,
        fit: BoxFit.contain,
      ),
    );
  }

  Container _buildUserNameContainer() {
    return Container(
      height: 43,
      margin: EdgeInsets.only(bottom: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          style: TextStyle(fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
          controller: _userNameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              hintText: AppLocalizations.of(context)?.translate(THE_NAME),
              hintStyle: const TextStyle(
                  fontSize: 17,
                  color: FarahTHree,
                  fontFamily: afrah_MEDIUM_FONT),
              prefixIcon: Image.asset("assets/userRegister.png",
                  alignment: Alignment.center, color: FarahTHree),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.5)),
                  borderSide:  BorderSide(color: Colors.black, width: 20))),
        ),
      ),
    );
  }

  Container _buildOhoneNumberContainer() {
    return Container(
      height: 43,
      margin: EdgeInsets.only(bottom: 20),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextField(
          style: TextStyle(fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
          controller: _phoneNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              hintText: AppLocalizations.of(context)?.translate(MOBILE_NUMBER),
              hintStyle: TextStyle(
                  fontSize: 17,
                  color: FarahTHree,
                  fontFamily: afrah_MEDIUM_FONT),
              prefixIcon:
                  Image.asset("assets/egypt.png", alignment: Alignment.center),
              prefixText: "2+  ",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.5)),
                  borderSide: new BorderSide(color: Colors.black, width: 20))),
        ),
      ),
    );
  }

  Container _buildPasswordContainer() {
    return Container(
      height: 43,
      margin: EdgeInsets.only(bottom: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          style: TextStyle(fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
          controller: _passwordNumberController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              hintText: AppLocalizations.of(context)?.translate(PASSWORD),
              hintStyle: TextStyle(
                  fontSize: 17,
                  color: FarahTHree,
                  fontFamily: afrah_MEDIUM_FONT),
              prefixIcon: Image.asset("assets/lockRegister.png",
                  alignment: Alignment.center, color: FarahTHree),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.5)),
                  borderSide: new BorderSide(color: Colors.black, width: 20))),
        ),
      ),
    );
  }

  Container _buildRepasswordContainer() {
    return Container(
      height: 43,
      margin: EdgeInsets.only(bottom: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          style: TextStyle(fontSize: 17, fontFamily: afrah_MEDIUM_FONT),
          controller: _repasswordNumberController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              hintText: AppLocalizations.of(context)?.translate(REPASSWORD),
              hintStyle: TextStyle(
                  fontSize: 17,
                  color: FarahTHree,
                  fontFamily: afrah_MEDIUM_FONT),
              prefixIcon: Image.asset("assets/lockRegister.png",
                  alignment: Alignment.center, color: FarahTHree),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.5)),
                  borderSide: new BorderSide(color: Colors.black, width: 20))),
        ),
      ),
    );
  }

  Container _buildButtonContainer(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 80),
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(color: Farah),
        ),
        onPressed: () => doinformationLogin(context),
        color: Farah,
        textColor: Farah_WHITECOLOR,
        child: Text(
          AppLocalizations.of(context)!.translate(REGISTERING_DATA),
          style: TextStyle(fontSize: 20, fontFamily: afrah_BOLD_FONT),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String errorMessage) {
    Widget okButton = TextButton(
      child: Text(
        AppLocalizations.of(context)!.translate(AGREE),
        textDirection: TextDirection.rtl,
      ),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.translate(ATTENSION),
        textDirection: TextDirection.rtl,
      ),
      content: Text(
        errorMessage,
        textDirection: TextDirection.rtl,
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

  _bottomScreen() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              AppLocalizations.of(context)!.translate(dONOTHAVEANACCOUNT),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: afrah_Regular_FONT,
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionsBuilder: (_, anim, __, child) =>
                          Container(child: child),
                      transitionDuration: Duration(seconds: 1))),
              child: Text(
                AppLocalizations.of(context)!.translate(LOGIN),
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 1,
                      offset: Offset(0, -5),
                    )
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 2,
                  fontSize: 20,
                  fontFamily: afrah_Regular_FONT,
                ),
              ),
            ),
          )
        ]);
  }

  doinformationLogin(context) async {
    FocusScope.of(context).unfocus();
   setState(() {
      _progressVisability = true;
    });
   _request = RegisterRequest(
       name:"mohamedgemy" ,
       email: "mohameed@gmail.com",
       password: "Mohamed9w3",
       passwordConfirmation:  "Mohamed9w3",
       gender:"male" ,
       phone:01114937973 
    );

     _registerPresenterInterface!.register(_request!);
//    setState(() {
//       _progressVisability = true;
//     });

//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp reMail =  RegExp(pattern);
//     RegExp regExp =  RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
//     if (_userNameController.text == "" ||
//    // _emailController.text == "" ||
//         _phoneNumberController.text == "" ||
//         _passwordNumberController.text == "" ||
//         _repasswordNumberController.text == "") {

//            setState(() {
//       _progressVisability = false;
//     });

//       Widget okButton = TextButton(
//         child: Text(
//           AppLocalizations.of(context)!.translate(AGREE),
//           textDirection: TextDirection.rtl,
//         ),
//         onPressed: () => Navigator.pop(context),
//       );

//       // set up the AlertDialog
//       AlertDialog alert = AlertDialog(
//         title: Text(AppLocalizations.of(context)!.translate(ATTENSION),
//             textDirection: TextDirection.rtl),
//         content: Text(
//           AppLocalizations.of(context)!.translate(PLEASE_FILL_ALL_DATA),
//           textDirection: TextDirection.rtl,
//         ),
//         actions: [
//           okButton,
//         ],
//       );

//       // show the dialog
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alert;
//         },
//       );
//     } else if (_userNameController.text.length < 3 ||
// //!reMail.hasMatch(_emailController.text) ||
//         !regExp.hasMatch(_phoneNumberController.text) ||
//         _passwordNumberController.text != _repasswordNumberController.text) {

//            setState(() {
//       _progressVisability = false;
//     });

//       Widget okButton = TextButton(
//         child: Text(
//           AppLocalizations.of(context)!.translate(AGREE),
//           textDirection: TextDirection.rtl,
//         ),
//         onPressed: () => Navigator.pop(context),
//       );

//       AlertDialog alert = AlertDialog(
//         title: Text(AppLocalizations.of(context)!.translate(ATTENSION),
//             textDirection: TextDirection.rtl),
//         content: Text(
//           AppLocalizations.of(context)!.translate(PLEASE_ENTER_CORRECT_DATA),
//           textDirection: TextDirection.rtl,
//         ),
//         actions: [
//           okButton,
//         ],
//       );

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alert;
//         },
//       );
//     } else {


//     _registerPresenterInterface!.register(_request!);

    

//     }

  }

   @override
  void onLoadDataComplete(Register registerResponse) {
   setState(() {
     _progressVisability = false ;
   });
         
         
         
         print("successssssssssssssssssssssssss");
          //   for ( var i in registerResponse.result ) {
  
          // getusername = i.cUSTATTEMAIL ;
          // getMobileNumber =  i.cUSTATTMOBILE ;
          // token = i.uSERTOKEN ;
          //  nameOfUser = i.cUSTNAMEEN;
          //  nameOfUserAr = i.cUSTNAMEAR;

          //   }
        // _setData();
        //                    if (registerResponse.result.isNotEmpty){
        //         setOrNotSetLoginSharedPreference(true);

        //                 Navigator.push(
        //                   context,
        //                   PageRouteBuilder(
        //                       pageBuilder: (_, __, ___) => BottomNavScreenn(),
        //                       transitionsBuilder: (_, anim, __, child) =>
        //                           Container(child: child),
        //                       transitionDuration: Duration(seconds: 1)));

        //                    }else {
        //                       showAlertDialog(context, "this account is found please  Register again");
                
                 
                
        //                    }  
                           
                              }
          
            @override
            void onLoadDataError(ErrorResponse resetRegister) {
             if (this.mounted) {
                      setState(() {
                        _progressVisability = false;
                
                        showAlertDialog(context, resetRegister.message);
                        //  _uiInteraction = false;
                      });
                    }  }
}
