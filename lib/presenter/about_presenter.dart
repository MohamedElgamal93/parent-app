import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/data/model/response_model/about.dart';
import 'package:scostudent/presenter/about_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/about_view_interface.dart';


class AboutPresenter implements AboutPresenterInterface {
late AboutViewInterface aboutViewInterface;
late AboutRepoInterface aboutInterface;

 AboutPresenter(this.aboutViewInterface) {
    aboutInterface =  Injector().getAboutRepo;
  }

  void loadData( ) {
    aboutInterface
        .about(
           ServiceUrls.about)
        .then((c) => aboutViewInterface.onLoadAboutComplete(c))
        .catchError((onError) => aboutViewInterface.onLoadAboutError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }



  @override
  void about() {
    loadData();
    
  }
}
