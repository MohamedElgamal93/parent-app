import 'package:flutter/material.dart';

import '../../app_constants.dart';
import '../../app_utiles/sizes.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String title;

  const HomeButton(
      {Key? key,
      required this.onPressed,
      required this.image,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: InkWell(
          onTap: onPressed,
          child: Column(
            children: [
              Container(
                  height: SizeConfig.height(context: context, pixels: 84),
                  width: SizeConfig.width(context: context, pixels: 84),
                  decoration: const BoxDecoration(
                    color: homePageColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(image)),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontFamily: afrah_BOLD_FONT,
                        fontSize: 11,
                        color: Colors.black),
                  ))
            ],
          )),
    );
  }
}
