
class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? gender;
  int? phone;

  RegisterRequest(
      {this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.gender,
      this.phone});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];

    password = json['password'];

    passwordConfirmation = json['password_confirmation'];
    gender = json['gender'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;

    data['password'] = password;

    data['password_confirmation'] = passwordConfirmation;

    data['gender'] = gender;
    data['phone'] = phone;
    return data;
  }
}
