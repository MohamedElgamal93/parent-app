import 'package:flutter/material.dart';
import '../../app_constants.dart';
import '../../app_utiles/sizes.dart';

class SectionShapCard extends StatelessWidget {
  final Widget child;

  const SectionShapCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
               color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                                 border: Border.all(color: borderColor, width: 2),
               

      ),
      child:
   Padding(
                  padding: EdgeInsets.only(
                  top: SizeConfig.width(context: context, pixels: 15),
                    // right:  SizeConfig.height(context: context, pixels: 12),
                    //  left: SizeConfig.height(context: context, pixels: 12),
                  ),
                  child:
       child,
    ));
  }
}
