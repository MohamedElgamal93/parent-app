import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/categories.dart';

abstract class CategoriesViewInterface {
  void onLoadCategoriesComplete(Categoriess categoriesResponse);
  void onLoadCategoriesError(ErrorResponse errorResponse);
}
