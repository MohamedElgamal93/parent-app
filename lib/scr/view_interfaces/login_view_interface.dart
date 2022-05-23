

import '../../data/api/error_data.dart';
import '../../data/model/response_model/login/login.dart';

abstract class LoginViewInterface {
  void onLoadDataComplete(Login loginResponse);
  void onLoadDataError(ErrorResponse resetRegister);
}
