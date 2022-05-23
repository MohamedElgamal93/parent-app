import 'notify_request.dart';

class NotifyResponse {
  NotifyResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final int status;
  late final Data data;
  late final String message;
  
  NotifyResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.userId,
    required this.title,
    required this.body,
  });
  late final int id;
  late final String type;
  late final int userId;
  late final String title;
  late final String body;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    type = json['type'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}
abstract class NotifyResponseRepoInterface{
  Future<NotifyResponse> notifyResponse(String url,NotifyRequest requestBody);
}