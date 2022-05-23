import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/data/model/response_model/packages.dart';
import 'package:scostudent/presenter/packages_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/packages_view_interface.dart';


class PackagesPresenter implements PackagesPresenterInterface {
 late PackagesViewInterface packagesViewInterface;
 late PackagesRepoInterface packagesInterface;

 PackagesPresenter(this.packagesViewInterface) {
    packagesInterface = new Injector().getPackagesRepo;
  }

  void loadData( ) {
    packagesInterface
        .packages(
           ServiceUrls.packages)
        .then((c) => packagesViewInterface.onLoadPackageComplete(c))
        .catchError((onError) => packagesViewInterface.onLoadPackageError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }



  @override
  void packages() {
    loadData();
    
  }
}
