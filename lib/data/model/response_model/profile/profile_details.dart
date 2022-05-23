class UserProfileDetails {
  UserProfileDetails({
    required this.id,
    required this.name,
     this.arabicName,
    required this.isAdmin,
    required this.phone,
     this.countryId,
     this.cityId,
     this.categoryId,
     this.serviceId,
    required this.gender,
    required this.email,
     this.emailVerifiedAt,
     this.apiToken,
     this.verificationCode,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final Null arabicName;
  late final int isAdmin;
  late final String phone;
  late final Null countryId;
  late final Null cityId;
  late final Null categoryId;
  late final Null serviceId;
  late final String gender;
  late final String email;
  late final Null emailVerifiedAt;
  late final Null apiToken;
  late final Null verificationCode;
  late final String createdAt;
  late final String updatedAt;
  
  UserProfileDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    arabicName = null;
    isAdmin = json['is_admin'];
    phone = json['phone'];
    countryId = null;
    cityId = null;
    categoryId = null;
    serviceId = null;
    gender = json['gender'];
    email = json['email'];
    emailVerifiedAt = null;
    apiToken = null;
    verificationCode = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['arabic_name'] = arabicName;
    _data['is_admin'] = isAdmin;
    _data['phone'] = phone;
    _data['country_id'] = countryId;
    _data['city_id'] = cityId;
    _data['category_id'] = categoryId;
    _data['service_id'] = serviceId;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['api_token'] = apiToken;
    _data['verification_code'] = verificationCode;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
abstract class UserProfileDetailsRepoInterface{
  Future<UserProfileDetails> userProfileDetails(String url);
}