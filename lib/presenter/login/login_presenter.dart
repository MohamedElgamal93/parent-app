import 'package:flutter/material.dart';
import '../../data/api/error_data.dart';
import '../../data/model/response_model/login/login_request.dart';
import '../../data/model/response_model/login/login.dart';
import '../../dependency_injection.dart';
import '../../scr/view_interfaces/login_view_interface.dart';
import 'login_presenter_interface.dart';

class LoginPresenter implements LoginPresenterInterface {
  late LoginViewInterface loginViewInterface;
  late LoginRepoInterface loginInterface;

  LoginPresenter(this.loginViewInterface) {
    loginInterface = Injector().getLoginRepo;
  }

  void loadData(LoginRequest loginRequestBody) {
    loginInterface
        .login("http://3.219.94.115/api/v1/auth/login", loginRequestBody)
        .then((c) => loginViewInterface.onLoadDataComplete(c))
        .catchError((onError) =>
            loginViewInterface.onLoadDataError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void login(LoginRequest loginRequestBody) {
    loadData(loginRequestBody);
  }
}
