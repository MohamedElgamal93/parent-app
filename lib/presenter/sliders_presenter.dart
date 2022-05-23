import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/data/model/response_model/slider.dart';
import 'package:scostudent/presenter/sliders_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/sliders_view_interface.dart';


class SlidersPresenter implements SlidersPresenterInterface {
  late SlidersViewInterface slidersViewInterface;
  late SlidersRepoInterface slidersInterface;

  SlidersPresenter(this.slidersViewInterface) {
    slidersInterface =  Injector().getSlidersRepo;
  }

  void loadData( ) {
    slidersInterface
        .sliders(
           ServiceUrls.sliders)
        .then((c) => slidersViewInterface.onLoadSlidersComplete(c))
        .catchError((onError) => slidersViewInterface.onLoadSlidersError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }



  @override
  void sliders() {
    loadData();
  }
    
  
}
