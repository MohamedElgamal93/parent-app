import 'package:flutter/services.dart';
import 'package:scostudent/app_utiles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_constants.dart';
import '../../app_utiles/app_utils.dart';
import '../../lang/AppLocalizations.dart';
import '../widgets/list_tile_widget.dart';
import 'send_note.dart';

class SettingHomeScreen extends StatefulWidget {
  const SettingHomeScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _SettingHomeScreenState createState() => _SettingHomeScreenState();
}

class _SettingHomeScreenState extends State<SettingHomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final double collapsedHeight = 70;
  final double expandedHeight = 80;
  String username = "";
    AppLocalizations? localizations;

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
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: secondaryColor));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: secondaryColor),
        child: Scaffold(
          backgroundColor: homePageColor,
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: expandedHeight,
                    collapsedHeight: collapsedHeight,
                    backgroundColor: secondaryColor,
                    automaticallyImplyLeading: false,
                    stretch: false,
                    // used to check for current heigh to check if appbar
                    // is expanded or collapsed
                    flexibleSpace: Container(
                        decoration: const BoxDecoration(
                       color: homePageColor
                        ),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            var top = constraints.biggest.height;
                            bool isExpanded = top <= expandedHeight * 1.5;
                            return FlexibleSpaceBar(
                              stretchModes: const [StretchMode.zoomBackground],
                              titlePadding: EdgeInsets.zero,
                              // centerTitle: true,
                              // content to show when appbar is collapsed
                              title: isExpanded
                                  ? SafeArea(
                                      child: Container(
                                        height: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.width(
                                            context: context,
                                            pixels: 20,
                                          ),
                                        ),
                                        child: Text(
                                        localizations!.translate(setting) ,
                                           style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontTextmedium,
                                                  fontSize: 20)
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              // content to show when appbar is expanded
                              background: isExpanded
                                  ? const SizedBox()
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(
                                              SizeConfig.width(
                                                  context: context, pixels: 8)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: SizeConfig
                                                              .width(
                                                                  context:
                                                                      context,
                                                                  pixels: 12)),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            SizedBox(
                                                              height: SizeConfig
                                                                  .height(
                                                                      context:
                                                                          context,
                                                                      pixels:
                                                                          28),
                                                            ),
                                                            Text(
                                                             localizations!.translate(setting) ,
                                        
                                                              softWrap: true,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontTextmedium,
                                                  fontSize: 20)
                                                            ),
                                                            const Text(
                                                              "",
                                                              softWrap: true,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      afrah_BOLD_FONT,
                                                                  fontSize: 20),
                                                            )
                                                          ]))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            );
                          },
                        )),
                  )
                ];
              },
              body: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.start,

                    children: [
                      const SizedBox(
                        height: 120,
                      ),
               ListTileWidget(
        title: localizations!.translate(notifcation),
        imageName: "assets/images/notification.png",
        onTab: () => print("dffff"),
        showNotifcation: true,
        showIcone: false
        ),
        SizedBox(height: 10,),
           ListTileWidget(
        title: localizations!.translate(sendNote),
        imageName: "assets/images/notes.png",
        onTab: () =>   Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => const SendNoteScreen(),
            transitionsBuilder: (_, anim, __, child) => Container(child: child),
            transitionDuration: const Duration(seconds: 1))),
           showIcone: true
        ),

        

                SizedBox(height: 10,),

           ListTileWidget(
        title: localizations!.translate(accountSetting),
        imageName: "assets/images/settings_outline.png",
        onTab: () => print("dffff"),
            showIcone: true),  
                const SizedBox(height: 10,),

           ListTileWidget(
        title: localizations!.translate(changePassword),
        imageName: "assets/images/change_password.png",
        onTab: () => print("dffff"),
            showIcone: true), 
                const SizedBox(height: 10,),
   
         ListTileWidget(
        title: localizations!.translate(signOut),
        imageName: "assets/images/log_out.png",
        onTab: () => showLogoutDialog(
            context,
            AppLocalizations.of(context)!.translate(AGREE),
            AppLocalizations.of(context)!.translate(CANACEL),
            AppLocalizations.of(context)!.translate(ATTENSION),
            AppLocalizations.of(context)!
                .translate(ARE_YOU_SURE_YOU_WANT_TO_LOG_OUT)), 
                   showIcone: false)
                    ],
                  ))),
        ));
  }

  Future<void> getUserData() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
                username = prefs.getString('user_name') ?? "";

      });
  }
}
