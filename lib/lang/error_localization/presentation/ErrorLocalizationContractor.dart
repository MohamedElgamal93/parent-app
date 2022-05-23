// import 'package:scostudent/dependency_injection.dart';
// import 'package:scostudent/lang/data/error_data.dart';
// import 'package:scostudent/lang/error_localization/data/ErrorLocalDataSource.dart';
// import 'package:scostudent/lang/error_localization/data/model/error_localization_data.dart';

// abstract class ErrorLocalizationContractor {
//   void onGetErrorLocalization(List<ErrorLocalization> errorLocalList);

//   void onGetErrorLocalizationFailed(ErrorResponse err);
// }

// class ErrorLocalPresenter {
// late  ErrorLocalizationContractor _view;
//  late  ErrorLocalDataSource _errorLocalDataSource;

//   ErrorLocalPresenter(this._view) {
//     _errorLocalDataSource = Injector().getErrorLocalizationRepProvider!;
//   }

//   void getErrorLocalizationMessages() {
//     _errorLocalDataSource
//         .getErrorLocal()
//         .then((errorMessages) => _view.onGetErrorLocalization(errorMessages))
//         .catchError((err) => _view.onGetErrorLocalizationFailed(err));
//   }
// }
