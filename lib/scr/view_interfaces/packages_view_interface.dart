import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/packages.dart';

abstract class PackagesViewInterface {
  void onLoadPackageComplete(Packages packagesResponse);
  void onLoadPackageError(ErrorResponse errorResponse);
}
