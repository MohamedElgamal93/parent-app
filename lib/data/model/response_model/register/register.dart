


import 'package:scostudent/data/model/response_model/register/register_request.dart';

class Register {
  Register({
    required this.message,
    required this.user,
  });
  late final String message;
  late final User user;
  
  Register.fromJson(Map<String, dynamic> json){
    message = json['message'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.gender,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String name;
  late final String email;
  late final String gender;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  
  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}




abstract class RegisterRepoInterface{
  Future<Register> register(String url,RegisterRequest requestBody);
}