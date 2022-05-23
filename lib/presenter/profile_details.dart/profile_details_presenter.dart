import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/presenter/profile_details.dart/profile_details_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';

import '../../data/model/response_model/profile/profile_details.dart';
import '../../scr/view_interfaces/profile_details_view_interface.dart';


class UserProfileDetailsPresenter implements UserProfileDetailsPresenterInterface {
late UserProfileDetailsViewInterface userProfileDetailsViewInterface;
late UserProfileDetailsRepoInterface userProfileDetailsInterface;

 UserProfileDetailsPresenter(this.userProfileDetailsViewInterface) {
    userProfileDetailsInterface =  Injector().getUserProfileDetailsRepo;
  }

  void loadData( ) {
    userProfileDetailsInterface
        .userProfileDetails(
           ServiceUrls.getUserProfileDetails)
        .then((c) => userProfileDetailsViewInterface.onLoadUserProfileDetailsComplete(c))
        .catchError((onError) => userProfileDetailsViewInterface.onLoadUserProfileDetailsError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }



  @override
  void userProfileDetails() {
    loadData();
    
  }
}
