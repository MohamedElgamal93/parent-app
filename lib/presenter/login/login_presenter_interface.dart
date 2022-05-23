import '../../data/model/response_model/login/login_request.dart';

abstract class LoginPresenterInterface {
  void login(LoginRequest loginRequestBody);
}
