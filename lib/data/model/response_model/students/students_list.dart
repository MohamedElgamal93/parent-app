class BusStudents {
  int? status;
  List<Data>? data;
  String? message;

  BusStudents({this.status, this.data, this.message});

  BusStudents.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? firstNameEn;
  String? middleNameEn;
  String? lastNameEn;
  String? firstNameAr;
  String? middleNameAr;
  String? lastNameAr;
  Bus? bus;
  String? gender;
  String? religion;
  String? mobile;
  String? photo;

  Data(
      {this.id,
      this.firstNameEn,
      this.middleNameEn,
      this.lastNameEn,
      this.firstNameAr,
      this.middleNameAr,
      this.lastNameAr,
      this.bus,
      this.gender,
      this.religion,
      this.mobile,
      this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstNameEn = json['first_name_en'];
    middleNameEn = json['middle_name_en'];
    lastNameEn = json['last_name_en'];
    firstNameAr = json['first_name_ar'];
    middleNameAr = json['middle_name_ar'];
    lastNameAr = json['last_name_ar'];
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
    gender = json['gender'];
    religion = json['religion'];
    mobile = json['mobile'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name_en'] = this.firstNameEn;
    data['middle_name_en'] = this.middleNameEn;
    data['last_name_en'] = this.lastNameEn;
    data['first_name_ar'] = this.firstNameAr;
    data['middle_name_ar'] = this.middleNameAr;
    data['last_name_ar'] = this.lastNameAr;
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['mobile'] = this.mobile;
    data['photo'] = this.photo;
    return data;
  }
}

class Bus {
  int? id;
  String? number;
  String? brand;
  String? regPlate;
  Matron? matron;
  Matron? driver;

  Bus(
      {this.id,
      this.number,
      this.brand,
      this.regPlate,
      this.matron,
      this.driver});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    brand = json['brand'];
    regPlate = json['reg_plate'];
    matron =
        json['matron'] != null ? new Matron.fromJson(json['matron']) : null;
    driver =
        json['driver'] != null ? new Matron.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['brand'] = this.brand;
    data['reg_plate'] = this.regPlate;
    if (this.matron != null) {
      data['matron'] = this.matron!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    return data;
  }
}

class Matron {
  int? id;
  String? firstNameEn;
  String? middleNameEn;
  String? lastNameEn;
  String? firstNameAr;
  String? middleNameAr;
  String? lastNameAr;
  String? mobile;

  Matron(
      {this.id,
      this.firstNameEn,
      this.middleNameEn,
      this.lastNameEn,
      this.firstNameAr,
      this.middleNameAr,
      this.lastNameAr,
      this.mobile});

  Matron.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstNameEn = json['first_name_en'];
    middleNameEn = json['middle_name_en'];
    lastNameEn = json['last_name_en'];
    firstNameAr = json['first_name_ar'];
    middleNameAr = json['middle_name_ar'];
    lastNameAr = json['last_name_ar'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name_en'] = this.firstNameEn;
    data['middle_name_en'] = this.middleNameEn;
    data['last_name_en'] = this.lastNameEn;
    data['first_name_ar'] = this.firstNameAr;
    data['middle_name_ar'] = this.middleNameAr;
    data['last_name_ar'] = this.lastNameAr;
    data['mobile'] = this.mobile;
    return data;
  }
}
abstract class BusStudentsRepoInterface {
  Future<BusStudents> busStudents(String url);
}