
class ReceiveLocation {
  int? status;
  Data? data;
  String? message;

  ReceiveLocation({this.status, this.data, this.message});

  ReceiveLocation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? lat;
  String? lng;
  bool? online;

  Data({this.id, this.lat, this.lng, this.online});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

        if (json['lat'] != null) {
      lat = json['lat'];
    }
    if (json['lng'] != null) {
      lng = json['lng'];
    }

    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['online'] = this.online;
    return data;
  }
}

abstract class ReceiveLocationRepoInterface {
  Future<ReceiveLocation> receiveLocation(String url);
}
