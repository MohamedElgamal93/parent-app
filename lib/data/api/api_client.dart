import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:scostudent/app_constants.dart';
import 'package:scostudent/app_utiles/app_utils.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/data/model/response_model/slider.dart';
import 'package:scostudent/data/model/response_model/packages.dart';
import 'package:scostudent/data/model/response_model/about.dart';
import 'package:scostudent/data/model/response_model/categories.dart';
import 'package:scostudent/data/model/response_model/categories_home.dart';
import 'package:scostudent/data/model/response_model/category_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/response_model/login/login.dart';
import '../model/response_model/notify/notify_reponse.dart';
import '../model/response_model/profile/profile_details.dart';
import '../model/response_model/received_location/recieved_location.dart';
import '../model/response_model/register/register.dart';
import '../model/response_model/students/students_list.dart';

//String language;
enum RequestType {
  fetchProducts,
  fetchSliders,
  fetchPackages,
  fetchAbout,
  fetchCategoryHome,
  fetchCategoryServices,
  fetchCategorys,
  fetchRegister,
  fetchLogin,
  fetchUserProfileDetails,receiveLocation,busStudents,fetchNotifyResponse
}

dynamic getRequestBody(String requestBody) {
  return requestBody;
}

Future<dynamic> getCallServiceExperties(
    dynamic url, RequestType requestType) async {
  try {
   final prefs = await SharedPreferences.getInstance();
       String token = prefs.getString('user_token') ?? "";

    final result = await InternetAddress.lookup(GOOGLE_COM);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        var urlMain = Uri.parse('$url');

        final response = await http.get(urlMain, headers: {
                  HttpHeaders.contentTypeHeader: APPLICATION_JSON,
                  'Authorization': 'Bearer $token',
                }).timeout(
            const Duration(seconds: 180),
            onTimeout: () =>
                throw ErrorResponse(
                  message: CODE_2,
                // error: TIME_OUT
                 ));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${utf8.decode(response.bodyBytes)}');

        if (!(statusCode >= 200 && statusCode <= 201)) {
          logD('error response ${utf8.decode(response.bodyBytes)}');
          if (statusCode >= 500 && statusCode < 599) {
            if (response.body.contains('Session Expired')) {
              throw ErrorResponse(
                   code: statusCode.toString(),
                  // key: "",
                  message: 'Session Expired',
                  // error: ""
                  
                  );
            } else {
              throw ErrorResponse(
                  message: (statusCode == 504)
                      ? 'check internet connection'
                      : response.body,
                  code: STATUS_CODE + statusCode.toString()
                  );
            }
          } else if (statusCode == 401) {
            var errorResponse =
                errorResponseFromJson(utf8.decode(response.bodyBytes));
            throw ErrorResponse(
                 code: code_401,
                // key: errorResponse.key,
                message: errorResponse.message,
                // error: errorResponse.error
                );
          } else {
            var errorResponse =
                errorResponseFromJson(utf8.decode(response.bodyBytes));
            throw ErrorResponse(
                 code: errorResponse.code,
                // key: errorResponse.key,
                message: errorResponse.message,
                //error: errorResponse.error
                );
          }
        }
        if (response.body.contains("\"restException\":")) {
          dynamic errorResponse =
              restExceptionFromJson(utf8.decode(response.bodyBytes))
                  .errorResponse;
          throw ErrorResponse(
             code: errorResponse.code,
              // key: errorResponse.key,
              message: errorResponse.message,
            //  error: errorResponse.error
              
              );
        } else {
          switch (requestType) {
            //Success
            case RequestType.fetchSliders:
              final sliders =
                  SlidersResponse.fromJson(json.decode(response.body));
              return sliders;
            case RequestType.fetchPackages:
              final packages = Packages.fromJson(json.decode(response.body));
              return packages;

            case RequestType.fetchAbout:
              final about = About.fromJson(json.decode(response.body));
              return about;

            case RequestType.fetchCategoryHome:
              final blogs = CategoriesHome.fromJson(json.decode(response.body));
              return blogs;

            case RequestType.fetchCategoryServices:
              final categoryServices =
                  CategoryServices.fromJson(json.decode(response.body));
              return categoryServices;

            case RequestType.fetchCategorys:
              final categories =
                  Categoriess.fromJson(json.decode(response.body));
              return categories;

            case RequestType.fetchUserProfileDetails:
              final userProfileDetails =
                  UserProfileDetails.fromJson(json.decode(response.body));
              return userProfileDetails;


                       case RequestType.receiveLocation:
              final receiveLocation =
                  ReceiveLocation.fromJson(json.decode(response.body));
              return receiveLocation;

        case RequestType.busStudents:
              final busStudents =
                  BusStudents.fromJson(json.decode(response.body));
              return busStudents;        

            default:
              {}
          }
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: NO_SUCH_METHOD_ERROR,
           // error: e.toString() + NO_SUCH_METHOD_ERROR
            );
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SOCKET_EXCEPTION, 
          code: e.message + SOCKET_EXCEPTION
            );
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: TIMEOUT_EXCEPTION, 
           // error: e.message! + TIMEOUT_EXCEPTION
            );
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: HANDSHAKE_EXCEPTION,
            //error: e.message + HANDSHAKE_EXCEPTION
            );
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: FORMAT_EXCEPTION,
            // error: e.message + FORMAT_EXCEPTION
             );
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: TYPE_ERROR, 
            //error: e.toString() + TYPE_ERROR
            );
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

Future<dynamic> postMethodDigital(
    dynamic url, RequestType requestType, dynamic requestBody) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user_token') ?? "";
    print("$token mmmedoooooooooooo");

    final result = await InternetAddress.lookup(GOOGLE_COM);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        var urlMain = Uri.parse('$url');
        final response = await http
            .post(urlMain,
                headers: {
                  HttpHeaders.contentTypeHeader: APPLICATION_JSON,
                  'Authorization': 'Bearer $token',
                },
                body: getRequestBody(requestBody))
            .timeout(const Duration(seconds: 180),
                onTimeout: () =>
                    throw ErrorResponse(message: CODE_2, 
                  //  error: TIME_OUT
                    ));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${utf8.decode(response.bodyBytes)}');

        if (!(statusCode >= 200 && statusCode <= 201)) {
          logD('error response ${utf8.decode(response.bodyBytes)}');
          if (statusCode >= 500 && statusCode < 599) {
            if (response.body.contains('Session Expired')) {
              throw ErrorResponse(
                  // code: statusCode.toString(),
                  // key: "",
                  message: 'Session Expired',
                //  error: ""
                  );
            } else
              throw ErrorResponse(
                  message: (statusCode == 504)
                      ? 'check internet connection'
                      : response.body,
                 // error: STATUS_CODE + statusCode.toString()
                  );
          } else if (statusCode == 401) {
            var errorResponse =
                errorResponseFromJson(utf8.decode(response.bodyBytes));
            throw ErrorResponse(
                code: code_401,
                // key: errorResponse.key,
                message: errorResponse.message,
                //error: errorResponse.error
                );
          } else {
            var errorResponse =
                errorResponseFromJson(utf8.decode(response.bodyBytes));
            throw ErrorResponse(
               code: errorResponse.code,
                // key: errorResponse.key,
                message: errorResponse.message,
              //  error: errorResponse.error
                );
          }
        }
        if (response.body.contains("\"restException\":")) {
          var errorResponse =
              restExceptionFromJson(utf8.decode(response.bodyBytes))
                  .errorResponse;
          throw ErrorResponse(
             code: errorResponse!.code,
              // key: errorResponse.key,
              message: errorResponse.message,
            //  error: errorResponse.error
              );
        } else {
          switch (requestType) {
            //Success
            case RequestType.fetchRegister:
              final register = Register.fromJson(json.decode(response.body));
              return register;
            case RequestType.fetchLogin:
              final register = Login.fromJson(json.decode(response.body));
              return register;

                case RequestType.fetchNotifyResponse:
              final notifyResponse = NotifyResponse.fromJson(json.decode(response.body));
              return notifyResponse;

            default:
              {}
          }
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: NO_SUCH_METHOD_ERROR,
           // error: e.toString() + NO_SUCH_METHOD_ERROR
            );
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: SOCKET_EXCEPTION,
             //error: e.message + SOCKET_EXCEPTION
             );
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: TIMEOUT_EXCEPTION, 
           // error: e.message! + TIMEOUT_EXCEPTION
            );
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: HANDSHAKE_EXCEPTION,
          //  error: e.message + HANDSHAKE_EXCEPTION
            );
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: FORMAT_EXCEPTION, 
            //error: e.message + FORMAT_EXCEPTION
            );
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: TYPE_ERROR,
            // error: e.toString() + TYPE_ERROR
             );
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}
