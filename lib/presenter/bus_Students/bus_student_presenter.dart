import 'package:flutter/material.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/dependency_injection.dart';
import '../../data/model/response_model/students/students_list.dart';
import '../../scr/view_interfaces/student_bus_view_interface.dart';
import 'bus_student_presenter_interface.dart';

class BusStudentsPresenter implements BusStudentsPresenterInterface {
  late BusStudentsViewInterface busStudentsViewInterface;
  late BusStudentsRepoInterface busStudentsRepoInterface;

  BusStudentsPresenter(this.busStudentsViewInterface) {
    busStudentsRepoInterface = Injector().getBusStudentsRepo;
  }

  void loadData() {
    busStudentsRepoInterface
        .busStudents("http://3.219.94.115/api/v1/transportation/parentStudents")
        .then((c) => busStudentsViewInterface.onLoadBusStudentsComplete(c))
        .catchError((onError) => busStudentsViewInterface
            .onLoadBusStudentsError(onError is FlutterError
                ? ErrorResponse(message: onError.message)
                : onError is AssertionError
                    ? ErrorResponse(message: onError.message)
                    : onError));
  }

  @override
  void busStudents() {
    loadData();
  }
}
