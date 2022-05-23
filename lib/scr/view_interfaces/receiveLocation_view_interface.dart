import 'package:scostudent/data/api/error_data.dart';

import '../../data/model/response_model/received_location/recieved_location.dart';

abstract class ReceiveLocationViewInterface {
  void onLoadReceiveLocationComplete(ReceiveLocation receiveLocationResponse);
  void onLoadReceiveLocationError(ErrorResponse errorResponse);
}
