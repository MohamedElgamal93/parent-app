import 'package:scostudent/scr/sco_bottom_bar/profile.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/scr/sco_bottom_bar/setting_home.dart';
import '../../app_constants.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import '../../live_location/live_location.dart';
import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key,}) : super(key: key);
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  bool show = false;
  int _currentIndex = 0;
  AppLocalizations? localizations;

  final List _children = [
    const HomeScreen(),
    const MyHomePageLiveLocation(),
    const MyHomePageLiveLocation(),
    const MyHomePageLiveLocation(),
    const SettingHomeScreen(),
  ];
@override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     leading: Builder(
      //       builder: (BuildContext context) {
      //         return IconButton(
      //           icon: const Icon(Icons.menu),
      //           onPressed: () {
      //             Scaffold.of(context).openDrawer();
      //           },
      //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         );
      //       },
      //     ),
      //     backgroundColor: Palette.primaryColor,
      //     elevation: 0.0,
      //     automaticallyImplyLeading: false,
      //     title: Directionality(
      //         textDirection: TextDirection.ltr,
      //         child: Padding(
      //             padding: const EdgeInsets.only(right: 0.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 Visibility(
      //                   visible: _imageVisibality,
      //                   child: Image.asset(
      //                     _image!,
      //                     width: 40,
      //                     height: 30,
      //                   ),
      //                 ),
      //                 Visibility(
      //                     visible: _titleVisibality,
      //                     child: Text(
      //                       _title!,
      //                       style: const TextStyle(
      //                           color: Colors.white,
      //                           fontSize: 20,
      //                           fontFamily: afrah_BOLD_FONT),
      //                     )),
      //                 const SizedBox(width: 5)
      //               ],
      //             )))),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: AssetImage(afrah_LOGIN_LOGO), fit: BoxFit.fill),
      //         ),
      //         child: SizedBox(),
      //       ),
      //       ListTile(
      //         title: const Text('Notification'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('Academic'),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 0.0,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home_non_active.png",
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/images/home_active.png",
                width: 30,
                height: 30,
              ),
              label:localizations!.translate(home) ,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/student_non_active.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                "assets/images/student_active.png",
                width: 30,
                height: 30,
              ),
              label:localizations!.translate(studentInfo) ,
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/news_non_active.png",
                  width: 20,
                  height: 20,
                ),
                activeIcon: Image.asset(
                  "assets/images/news_active.png",
                  width: 30,
                  height: 30,
                ),
                label: localizations!.translate(newsFeed) ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/notification_non_active.png",
                  width: 20,
                  height: 20,
                ),
                activeIcon: Image.asset(
                  "assets/images/notification_active.png",
                  width: 30,
                  height: 30,
                ),
                label:localizations!.translate(notifcation)  ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/setting_non_active.png",
                  width: 20,
                  height: 20,
                ),
                activeIcon: Image.asset(
                  "assets/images/setting_active.png",
                  width: 30,
                  height: 30,
                ),
                label: localizations!.translate(setting)  ),
          ],
          selectedItemColor: Color(0xff3C85A6),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
      }
    });
  }
}
