import 'package:flutter/material.dart';

import '../../app_constants.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
               color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),

      ),
      child: child,
    );
  }
}
