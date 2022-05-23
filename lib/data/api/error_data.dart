import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
     this.code,
    required this.message,
  });
  late final dynamic code;
  late final dynamic message;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json['status'];

    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = code;

    _data['message'] = message;
    return _data;
  }
}

ErrorResponse errorResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return ErrorResponse.fromJson(jsonData);
}

RestException restExceptionFromJson(String str) {
  final jsonData = json.decode(str);
  return RestException.fromJson(jsonData);
}

class RestException {
  ErrorResponse? errorResponse;

  RestException({
    this.errorResponse,
  });

  RestException.fromJson(Map<String, dynamic> json) {
    errorResponse = (json['restException'] != null
        ? new ErrorResponse.fromJson(json['restException'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errorResponse != null) {
      data['restException'] = this.errorResponse!.toJson();
    }
    return data;
  }
}
