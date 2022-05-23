class ErrorModel {
  ErrorModel({
    required this.error,
  });
  late final String error;
  
  ErrorModel.fromJson(Map<String, dynamic> json){
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    return _data;
  }
}