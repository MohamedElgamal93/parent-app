
import 'package:scostudent/data/api/api_client.dart';
import '../model/response_model/received_location/recieved_location.dart';

class ReceiveLocationReposotory implements ReceiveLocationRepoInterface {
  @override
  Future<ReceiveLocation> receiveLocation(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.receiveLocation);
  }
}
