

import '../../data/api/error_data.dart';
import '../../data/model/response_model/register/register.dart';

abstract class RegisterViewInterface {
  void onLoadDataComplete(Register registerResponse);
  void onLoadDataError(ErrorResponse resetRegister);
}
