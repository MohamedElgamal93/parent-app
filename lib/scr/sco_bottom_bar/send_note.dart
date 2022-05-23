import 'package:flutter/services.dart';
import 'package:scostudent/app_utiles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/model/response_model/notify/notify_reponse.dart';
import 'package:scostudent/data/api/error_data.dart';
import '../../app_constants.dart';
import '../../data/model/response_model/notify/notify_request.dart';
import '../../lang/AppLocalizations.dart';
import '../../presenter/notify/notify_presenter.dart';
import '../../presenter/notify/notify_presenter_interface.dart';
import '../view_interfaces/notify_view_interface.dart';
import '../widgets/center_progress_bar.dart';
import '../widgets/dropdown_search.dart';
import '../widgets/section_card.dart';

class SendNoteScreen extends StatefulWidget {
  const SendNoteScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _SendNoteScreenState createState() => _SendNoteScreenState();
}

class _SendNoteScreenState extends State<SendNoteScreen>
    implements NotifyResponseViewInterface {
  final TextEditingController searchController = TextEditingController();
  final double collapsedHeight = 70;
  final double expandedHeight = 130;
  String username = "";
  bool _progressVisability = false;

  final _formKey = GlobalKey<FormState>();
  dynamic selectedItem;
  AppLocalizations? localizations;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  NotifyResponsePresenterInterface? _notifyResponsePresenterInterface;
  NotifyRequest? _request;
  _SendNoteScreenState() {
    _notifyResponsePresenterInterface = NotifyResponsePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: secondaryColor));
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: homePageColor,
        appBar: AppBar(
            backgroundColor: homePageColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: SizeConfig.width(context: context, pixels: 100),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(localizations!.translate(sendANote),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: fontTextmedium,
                                fontSize: 20)))
                  ],
                ))),
        body: Stack(children: [
          Form(
            key: _formKey,
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: SectionCard(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.height(context: context, pixels: 12),
                        left: SizeConfig.width(context: context, pixels: 16),
                        right: SizeConfig.width(context: context, pixels: 16),
                        bottom:
                            SizeConfig.height(context: context, pixels: 16)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          SingleChildScrollView(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(localizations!.translate(noteTo),
                                              style: const TextStyle(
                                                  color: hintColorColor,
                                                  fontFamily: fontTextRegular,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      DropDownSearch(
                                        showUnbderLine: true,
                                        hint: localizations!
                                            .translate(pleaseSelect),
                                        items: [
                                          "Bus",
                                          "Bus",
                                          "Bus",
                                          "Bus",
                                          "Bus",
                                          "Bus"
                                        ],
                                        voidCallback: (value) {
                                          selectedItem = value;
                                          print(selectedItem.runtimeType);
                                        },
                                      ),
                                      Container(
                                        height: 43,
                                        margin: const EdgeInsets.only(
                                            bottom: 20,
                                            top: 20,
                                            left: 10,
                                            right: 10),
                                        child: TextFormField(
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return localizations!
                                                  .translate(pleaseEnterText);
                                            }
                                            return null;
                                          },
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontFamily: afrah_MEDIUM_FONT),
                                          controller: titleController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              // contentPadding:
                                              //     const EdgeInsets.symmetric(horizontal: 30),
                                              hintText: localizations!
                                                  .translate(title),
                                              hintStyle: const TextStyle(
                                                  color: hintColorColor,
                                                  fontFamily: fontTextRegular,
                                                  fontSize: 16)
                                              // prefixIcon: Image.asset("assets/userRegister.png",
                                              //     alignment: Alignment.center, color: iconsColor),
                                              ),
                                        ),
                                      ),
                                      Container(
                                        // height: 43,
                                        margin: const EdgeInsets.only(
                                            bottom: 20,
                                            top: 20,
                                            left: 10,
                                            right: 10),
                                        child: TextFormField(
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return localizations!
                                                  .translate(pleaseEnterText);
                                            }
                                            return null;
                                          },
                                          minLines: 1,
                                          maxLines: 6,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontFamily: afrah_MEDIUM_FONT),
                                          controller: messageController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            // contentPadding:
                                            //     const EdgeInsets.symmetric(horizontal: 30),
                                            hintText: localizations!
                                                .translate(message),
                                            hintStyle: const TextStyle(
                                                color: hintColorColor,
                                                fontFamily: fontTextRegular,
                                                fontSize: 16),
                                            // prefixIcon: Image.asset("assets/userRegister.png",
                                            //     alignment: Alignment.center, color: iconsColor),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 100),
                                        child: InkWell(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                if (selectedItem != null) {
                                                  setState(() {
                                                    _progressVisability = true;
                                                  });

                                                  _request = NotifyRequest(
                                                    title: titleController.text
                                                        .trim(),
                                                    body: messageController.text
                                                        .trim(),
                                                    type: selectedItem,
                                                  );
                                                  _notifyResponsePresenterInterface!
                                                      .notifyResponse(
                                                          _request!);
                                                } else {
                                                  showAlertDialog(
                                                      context,
                                                      localizations!.translate(
                                                          pleaseChooseOneItem));
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 43,
                                              margin: const EdgeInsets.only(
                                                  bottom: 20,
                                                  top: 20,
                                                  left: 50,
                                                  right: 50),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: containerColor),
                                              child: Center(
                                                  child: Text(
                                           localizations!.translate(send)   ,
                                               style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontTextmedium,
                                                  fontSize: 18)
                                              )),
                                            )),
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
          CenterCircularProgressbar(
              submitProgressVisbility: _progressVisability),
        ]));
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
  void onLoadDataComplete(NotifyResponse notifyResponse) {
    setState(() {
      _progressVisability = false;
      showAlertDialog(context, notifyResponse.message);
    });
  }

  @override
  void onLoadDataError(ErrorResponse error) {
    if (mounted) {
      setState(() {
        _progressVisability = false;

        showAlertDialog(context, error.message);
      });
    }
  }
}
