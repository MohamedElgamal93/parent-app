import 'package:scostudent/data/api/error_data.dart';
import '../../data/model/response_model/students/students_list.dart';

abstract class BusStudentsViewInterface {
  void onLoadBusStudentsComplete(BusStudents busStudentsResponse);
  void onLoadBusStudentsError(ErrorResponse errorResponse);
}
