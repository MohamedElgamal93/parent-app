
import 'dart:convert';
import '../api/api_client.dart';
import '../model/response_model/login/login_request.dart';
import '../model/response_model/login/login.dart';

class LoginReposotory implements LoginRepoInterface {


  @override
  Future<Login> login(
     String url,LoginRequest requestBody) async {
    return await postMethodDigital(
        url, RequestType.fetchLogin,json.encode(requestBody));
  }
}
