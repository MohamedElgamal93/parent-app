import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/about.dart';

abstract class AboutViewInterface {
  void onLoadAboutComplete(About aboutResponse);
  void onLoadAboutError(ErrorResponse errorResponse);
}
