import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' ;
import '../../app_utiles/sizes.dart';


class StudentDetailsWidget extends StatefulWidget {
  const StudentDetailsWidget({Key? key}) : super(key: key);

  @override
  _StudentDetails createState() => _StudentDetails();
}

class _StudentDetails extends State<StudentDetailsWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.width(context: context, pixels: 13),
        right: SizeConfig.width(context: context, pixels: 13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              contentPadding: const EdgeInsets.all(0),
              minVerticalPadding: 0,
              leading: Icon(
                Icons.house,
                size: 30,
                color: Colors.black.withOpacity(.6),
              ),
              title: Text(
                "cairo",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text("Garden City",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black.withOpacity(.5)))),
          const SizedBox(
            height: 12,
          ),
          
          Row(
            children: [
              Text(
                "matron Mariam",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  print("taped");
                 launch("tel://214324234");
                
                } 
                ,
                child:const Icon(Icons.call) 
              )
            
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: const Divider(),
          ),
          Row(
            children: [
              Text(
                "Bus Number ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text("17",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black.withOpacity(.5))),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: const Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Bus Start Leaving ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text.rich(
                  TextSpan(text: "6", children: [
                    TextSpan(
                        text: " AM",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black.withOpacity(.5))),
                  ]),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black.withOpacity(.5))),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: const Divider(),
          ),
          Row(
            children: [
              Text(
                "Bus Return School",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text("7 AM",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black.withOpacity(.5))),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: const Divider(),
          ),
        ],
      ),
    );
  }


            
}
