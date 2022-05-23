
import 'package:scostudent/data/model/response_model/register/register.dart';
import 'package:scostudent/data/model/response_model/register/register_request.dart';
import 'dart:convert';
import '../api/api_client.dart';

class RegisterReposotory implements RegisterRepoInterface {
  @override
  Future<Register> register(
     String url,RegisterRequest requestBody) async {
    return await postMethodDigital(
        url, RequestType.fetchRegister,json.encode(requestBody));
  }
}
