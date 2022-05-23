
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/category_services.dart';
class CategoryServicesReposotory implements CategoryServicesRepoInterface {
  @override
  Future<CategoryServices> categoryServices(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchCategoryServices);
  }
}
