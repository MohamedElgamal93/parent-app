import 'package:scostudent/data/api/service_urls.dart';
import 'package:scostudent/data/model/response_model/categories_home.dart';
import 'package:scostudent/presenter/blogs_presenter_interface.dart';
import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import 'package:scostudent/scr/view_interfaces/category_home_view_interface.dart';

class BlogsPresenter implements BlogsPresenterInterface {
   CategoryHomeViewInterface categoryHomeViewInterface;
  late CategoriesHomeRepoInterface blogsInterface;

  BlogsPresenter(this.categoryHomeViewInterface) {
    blogsInterface =  Injector().getBlogsRepo;
  }

  void loadData() {
    blogsInterface
        .blogs(ServiceUrls.categorieshomePage)
        .then((c) => categoryHomeViewInterface.onLoadBlogsComplete(c))
        .catchError((onError) =>
            categoryHomeViewInterface.onLoadBlogsError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void blogs() {
    loadData();
  }
}


