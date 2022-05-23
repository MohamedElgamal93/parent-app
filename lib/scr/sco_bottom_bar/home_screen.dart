import 'package:flutter/services.dart';
import 'package:scostudent/app_utiles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_constants.dart';
import '../../lang/AppLocalizations.dart';
import '../../notification/notification.dart';
import '../bus/student_details.dart';
import '../widgets/home_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final double collapsedHeight = 70;
  final double expandedHeight = 80;
  String username = "";
    AppLocalizations? localizations;

  @override
  void initState() {
    print("tokennnnnnnn ${PushNotification.token}" );
getUserData();
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
                            bool isExpanded = top <= expandedHeight * 1.1;
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
                                          "Hello $username",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
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
                                                  flex: 6,
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
                                                            Row(
                                                               crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
  Image.asset("assets/images/user_home_page.png"),
        Spacer(),
                                                         Padding(padding: EdgeInsets.only(top:30,),child:   Text(
                                                              "Droid Schools",
                                                              softWrap: true,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                               style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: fontTextmedium),
                                                            )),
                                                            Spacer()
                                                            ],)
                                                        
                                                         
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
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.width(context: context, pixels: 20),
                    right: SizeConfig.width(context: context, pixels: 20)),child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                       HomeButton(
                         onPressed:(() => print("dddddddd")),
                         image:"assets/images/academic.png",
                         title:localizations!.translate(acadimc) 
                       ),
                         HomeButton(
                         onPressed:(() =>      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  StudentDetails(),
                                              transitionsBuilder:
                                                  (_, anim, __, child) =>
                                                      Container(child: child),
                                              transitionDuration:
                                                  Duration(seconds: 1)))),
                         image:"assets/images/bus_image.png",
                         title:localizations!.translate(bus)  
                       ),
 HomeButton(
                         onPressed:(() =>    print("dadadada")),
                         image:"assets/images/medical.png",
                         title:localizations!.translate(medical) 
                       ),
                            
                        
                        
                        ],
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                     Padding(
                      padding: EdgeInsets.only(left: SizeConfig.width(context: context, pixels: 20),
                    right: SizeConfig.width(context: context, pixels: 20)),child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                       HomeButton(
                         onPressed:(() => print("dddddddd")),
                         image:"assets/images/parents_note.png",
                         title:localizations!.translate(parentsNote)  
                       ),
                         HomeButton(
                         onPressed:(()   => print("dddddddd")),
                         image:"assets/images/cafetria.png",
                         title:localizations!.translate(cafeteria)  
                       ),
 HomeButton(
                         onPressed:(() =>    print("dadadada")),
                         image:"assets/images/payment.png",
                         title:localizations!.translate(payment) 
                       ),
                            
                        
                        
                        ],
                      )),
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
