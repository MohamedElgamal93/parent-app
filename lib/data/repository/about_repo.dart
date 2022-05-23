
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/about.dart';

class AboutReposotory implements AboutRepoInterface {
  @override
  Future<About> about(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchAbout);
  }
}
