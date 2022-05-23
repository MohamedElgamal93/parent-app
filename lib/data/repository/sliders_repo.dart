
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/slider.dart';

class SlidersReposotory implements SlidersRepoInterface {
  @override
  Future<SlidersResponse> sliders(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchSliders);
  }


}
