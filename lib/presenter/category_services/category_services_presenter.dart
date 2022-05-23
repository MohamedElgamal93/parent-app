import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/presenter/category_services/categories_services_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/categories_services_view_interface.dart';
import 'package:scostudent/data/model/response_model/category_services.dart';

  class CategoryServicesPresenter implements CategoryServicesPresenterInterface {
 late CategoryServicesViewInterface categoryServicesViewInterface;
 late CategoryServicesRepoInterface categoryServicesInterface;

  CategoryServicesPresenter(this.categoryServicesViewInterface) {
    categoryServicesInterface = new Injector().getCategoryServicesRepo;
  }

  void loadData() {
    categoryServicesInterface
        .categoryServices(ServiceUrls.categoryServices)
        .then((c) =>
            categoryServicesViewInterface.onLoadCategoryServicesComplete(c))
        .catchError((onError) => categoryServicesViewInterface
            .onLoadCategoryServicesError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void categoryServices() {
    loadData();
  }
}
