import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/categories_home.dart';

abstract class CategoryHomeViewInterface {
  void onLoadBlogsComplete(CategoriesHome categoryResponse);
  void onLoadBlogsError(ErrorResponse error);

}
