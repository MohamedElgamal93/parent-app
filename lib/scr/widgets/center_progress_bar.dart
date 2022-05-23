import 'package:flutter/material.dart';

class CenterCircularProgressbar extends StatelessWidget {
  const CenterCircularProgressbar({
    Key? key,
    required bool submitProgressVisbility,
  })  : _submitProgressVisbility = submitProgressVisbility,
        super(key: key);

  final bool _submitProgressVisbility;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
          visible: _submitProgressVisbility,
          child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff3C85A6)),)),
    );
  }
}
