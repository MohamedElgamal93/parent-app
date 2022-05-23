
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/categories.dart';

class CategoriesReposotory implements CategoriesRepoInterface {
  

  @override
  Future<Categoriess> categories(dynamic url)async {
 return await getCallServiceExperties(
        url, RequestType.fetchCategorys);
  }
}
