import 'package:scostudent/data/api/error_data.dart';
import '../../data/model/response_model/profile/profile_details.dart';

abstract class UserProfileDetailsViewInterface {
  void onLoadUserProfileDetailsComplete(UserProfileDetails userProfileDetails);
  void onLoadUserProfileDetailsError(ErrorResponse errorResponse);
}
