
import 'package:flutter/material.dart';
import '../../app_constants.dart';
import '../../app_utiles/sizes.dart';

class ListTileWidget extends StatefulWidget {
  final String? title;
  final String? imageName;
  final VoidCallback? onTab;
    bool showIcone ;
    bool ?showNotifcation = false ;

   ListTileWidget({
    Key? key,
    required this.title,
    required this.imageName,
     required this.showIcone,
     this.showNotifcation,
    this.onTab,
  }) : super(key: key);



  @override
  _StudentSupDetailsState createState() => _StudentSupDetailsState();
}

class _StudentSupDetailsState extends State<ListTileWidget>{


bool valueTwofaqtorAuth = false ;
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return 
    Padding(padding: const EdgeInsets.only(left: 20,right:20),child:
    InkWell(
      onTap: widget.onTab,
      child: SizedBox(
        height: SizeConfig.height(context: context, pixels: 56),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${widget.imageName}",
                 // color: customColor,
                 // height: SizeConfig.height(context: context, pixels: 24),
                ),
                SizedBox(
                  width: SizeConfig.width(context: context, pixels: 11),
                ),
                Text(
                  "${widget.title}",
                     style: const TextStyle(
                                                 color: listColor,
                                                  fontFamily: fontTextRegular,
                                                  fontSize: 18)
                  
                ),
              ],
            ),

            if (widget.showIcone == true)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(width: SizeConfig.width(context: context, pixels: 8)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: listColor,
                  size: SizeConfig.height(context: context, pixels: 15),
                ),
              ],
            ),
 if (widget.showNotifcation == true)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(width: SizeConfig.width(context: context, pixels: 8)),
             Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        value: valueTwofaqtorAuth,
                        onChanged: (bool value) {
                         // dialogTwoFaq(context, value);
                         setState(() {
                                 valueTwofaqtorAuth = value;
                         });
                    
                        },
                        activeTrackColor: homePageColor,
                        activeColor: Colors.white,
                      ),
                    )
              ],
            )

          ],
        ),
      ),
    ));
  }
}
