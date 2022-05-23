import 'package:flutter/material.dart';
import 'package:scostudent/presenter/notify/notify_presenter_interface.dart';
import '../../data/api/error_data.dart';

import '../../data/model/response_model/notify/notify_reponse.dart';
import '../../data/model/response_model/notify/notify_request.dart';
import '../../dependency_injection.dart';
import '../../scr/view_interfaces/notify_view_interface.dart';

class NotifyResponsePresenter implements NotifyResponsePresenterInterface {
  late NotifyResponseViewInterface notifyResponseViewInterface;
  late NotifyResponseRepoInterface notifyResponseInterface;

 NotifyResponsePresenter(this.notifyResponseViewInterface) {
    notifyResponseInterface = Injector().getNotifyResponseRepo;
  }

  void loadData(NotifyRequest notifyRequestBody) {
    notifyResponseInterface
        .notifyResponse("http://3.219.94.115/api/v1/parentNotes", notifyRequestBody)
        .then((c) => notifyResponseViewInterface.onLoadDataComplete(c))
        .catchError((onError) =>
           notifyResponseViewInterface.onLoadDataError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void notifyResponse(NotifyRequest notifyRequestBody) {
    loadData(notifyRequestBody);
  }
}
