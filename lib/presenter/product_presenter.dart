// import 'package:scostudent/data/api/service_urls.dart';
// import 'package:scostudent/data/model/response_model/product.dart';
// import 'package:scostudent/presenter/product_presenter_interface.dart';
// import 'package:scostudent/scr/view_interfaces/product_view_interface.dart';
// import 'package:flutter/material.dart';
// import 'package:scostudent/data/api/error_data.dart';
// import 'package:scostudent/dependency_injection.dart';


// class ProductPresenter implements ProductPresenterInterface {
//   ProductViewInterface productViewInterface;
//   ProuductRepoInterface productInterface;

//   ProductPresenter(this.productViewInterface) {
//     productInterface = new Injector().getProductRepo;
//   }

//   void loadData( ) {
//     productInterface
//         .productLogin(
//            ServiceUrls.productUrl)
//         .then((c) => productViewInterface.onLoadDataComplete(c))
//         .catchError((onError) => productViewInterface.onLoadDataError(
//             onError is FlutterError
//                 ? ErrorResponse(message: onError.message)
//                 : onError is AssertionError
//                     ? ErrorResponse(message: onError.message)
//                     : onError));
//   }



//   @override
//   void product() {
//     loadData();
    
//   }
// }
