import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import '../../data/model/response_model/received_location/recieved_location.dart';
import '../../scr/view_interfaces/ReceiveLocation_view_interface.dart';
import 'location_presenter_interface.dart';

class ReceiveLocationPresenter implements ReceiveLocationPresenterInterface {
  late ReceiveLocationViewInterface receiveLocationViewInterface;
  late ReceiveLocationRepoInterface receiveLocationRepoInterface;

  ReceiveLocationPresenter(this.receiveLocationViewInterface) {
    receiveLocationRepoInterface = Injector().getReceiveLocationRepo;
  }

  void loadData(busId) {

var path =  "http://3.219.94.115/api/v1/transportation/buses/track?id=$busId";
print("wwwwwwwwwwwwwwwwwwwwwwwwww$path");

    receiveLocationRepoInterface
        .receiveLocation(
            path)
        .then((c) =>
            receiveLocationViewInterface.onLoadReceiveLocationComplete(c))
        .catchError((onError) => receiveLocationViewInterface
            .onLoadReceiveLocationError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void receiveLocation(int? busId) {
    loadData(busId);
  }
}
