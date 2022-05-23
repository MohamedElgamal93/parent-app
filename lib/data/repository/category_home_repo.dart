
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/categories_home.dart';
class CategoriesHomeReposotory implements CategoriesHomeRepoInterface {
  @override
  Future<CategoriesHome> blogs(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchCategoryHome);
  }
}
