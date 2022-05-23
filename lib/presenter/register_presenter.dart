import 'package:scostudent/data/model/response_model/register/register_request.dart';
import 'package:scostudent/presenter/register_presenter_interface.dart';
import 'package:flutter/material.dart';

import '../data/api/error_data.dart';
import '../data/model/response_model/register/register.dart';
import '../dependency_injection.dart';
import '../scr/view_interfaces/register_view_interface.dart';


class RegisterPresenter implements RegisterPresenterInterface {
 late RegisterViewInterface registerViewInterface;
 late RegisterRepoInterface registerInterface;

  RegisterPresenter(this.registerViewInterface) {
    registerInterface =  Injector().getRegisterRepo;
  }

  void loadData(RegisterRequest registerRequestBody) {
    registerInterface
        .register(
            "https://admin.scostudent.com/api/auth/register", registerRequestBody)
        .then((c) => registerViewInterface.onLoadDataComplete(c))
        .catchError((onError) => registerViewInterface.onLoadDataError(
            onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void register(RegisterRequest registerRequestBody) {
    
    loadData(registerRequestBody);
  }
}
