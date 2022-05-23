
import 'dart:convert';
import '../api/api_client.dart';
import '../model/response_model/notify/notify_reponse.dart';
import '../model/response_model/notify/notify_request.dart';

class NotifyResponseReposotory implements NotifyResponseRepoInterface {


  @override
  Future<NotifyResponse> notifyResponse(
     String url,NotifyRequest notifyRequest) async {
    return await postMethodDigital(
        url, RequestType.fetchNotifyResponse,json.encode(notifyRequest));
  }
}
