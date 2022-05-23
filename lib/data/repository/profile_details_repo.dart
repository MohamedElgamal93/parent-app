
import 'package:scostudent/data/api/api_client.dart';
import 'package:scostudent/data/model/response_model/profile/profile_details.dart';

class UserProfileDetailsReposotory implements UserProfileDetailsRepoInterface {
  @override
  Future<UserProfileDetails> userProfileDetails(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.fetchUserProfileDetails);
  }
}
