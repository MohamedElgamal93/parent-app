
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/packages.dart';

class PackagesReposotory implements PackagesRepoInterface {
  @override
  Future<Packages> packages(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchPackages);
  }
}
