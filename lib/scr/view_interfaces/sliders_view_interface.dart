import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/slider.dart';

abstract class SlidersViewInterface {
  void onLoadSlidersComplete(SlidersResponse slidersResponse);
  void onLoadSlidersError(ErrorResponse resetSlidersModel);

}
