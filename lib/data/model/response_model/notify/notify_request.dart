class NotifyRequest {
  NotifyRequest({
    required this.title,
    required this.body,
    required this.type,
  });
  late final String title;
  late final String body;
  late final String type;
  
  NotifyRequest.fromJson(Map<String, dynamic> json){
    title = json['title'];
    body = json['body'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['body'] = body;
    _data['type'] = type;
    return _data;
  }
}