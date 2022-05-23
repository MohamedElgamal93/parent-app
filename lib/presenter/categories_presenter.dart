import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/data/model/response_model/categories.dart';
import 'package:scostudent/presenter/categories_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/categories_view_interface.dart';


class CategoriesPresenter implements CategoriesPresenterInterface {
late  CategoriesViewInterface categoriesViewInterface;
late CategoriesRepoInterface categoriesInterface;

 CategoriesPresenter(this.categoriesViewInterface) {
    categoriesInterface = new Injector().getCategoriesRepo;
  }

  void loadData( ) {
   categoriesInterface
        .categories(
           ServiceUrls.categories)
        .then((c) => categoriesViewInterface.onLoadCategoriesComplete(c))
        .catchError((onError) => categoriesViewInterface.onLoadCategoriesError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }



  @override
  void categories() {
    loadData();
    
  }
}
