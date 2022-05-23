import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/category_services.dart';

abstract class CategoryServicesViewInterface {
  void onLoadCategoryServicesComplete(CategoryServices categoriesResponse);
  void onLoadCategoryServicesError(ErrorResponse errorResponse);
}
