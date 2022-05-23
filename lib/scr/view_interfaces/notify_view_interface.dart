

import '../../data/api/error_data.dart';
import '../../data/model/response_model/notify/notify_reponse.dart';

abstract class NotifyResponseViewInterface {
  void onLoadDataComplete(NotifyResponse notifyResponse);
  void onLoadDataError(ErrorResponse error);
}
