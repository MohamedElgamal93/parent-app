import 'package:scostudent/data/repository/sliders_repo.dart';
import 'data/model/response_model/login/login.dart';
import 'data/model/response_model/notify/notify_reponse.dart';
import 'data/model/response_model/profile/profile_details.dart';
import 'data/model/response_model/received_location/recieved_location.dart';
import 'data/model/response_model/register/register.dart';
import 'data/model/response_model/slider.dart';
import 'data/model/response_model/packages.dart';
import 'package:scostudent/data/repository/packages_repo.dart';
import 'package:scostudent/data/repository/about_repo.dart';
import 'data/model/response_model/about.dart';
import 'package:scostudent/data/repository/category_home_repo.dart';
import 'data/model/response_model/categories_home.dart';
import 'data/model/response_model/categories.dart';
import 'package:scostudent/data/repository/categories_repo.dart';
import 'data/model/response_model/category_services.dart';
import 'package:scostudent/data/repository/category_service_home_repo.dart';

import 'data/model/response_model/students/students_list.dart';
import 'data/repository/login_repository.dart';
import 'data/repository/notify_repo.dart';
import 'data/repository/profile_details_repo.dart';
import 'data/repository/receive_location_repo.dart';
import 'data/repository/register_repo.dart';
import 'data/repository/students_repo.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor? _flavor;
  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();
  // ErrorLocalRepo? get getErrorLocalizationRepProvider {
  //   var errorLocalRemoteDataSource = ErrorLocalRemoteDataSource.getInstance();
  //   switch (_flavor) {
  //     default:
  //       return ErrorLocalRepo.getInstance(errorLocalRemoteDataSource!);
  //   }
  // }

  SlidersRepoInterface get getSlidersRepo {
    return SlidersReposotory();
  }

  PackagesRepoInterface get getPackagesRepo {
    return PackagesReposotory();
  }

  AboutRepoInterface get getAboutRepo {
    return AboutReposotory();
  }

  CategoriesHomeRepoInterface get getBlogsRepo {
    return CategoriesHomeReposotory();
  }

  CategoriesRepoInterface get getCategoriesRepo {
    return CategoriesReposotory();
  }

  CategoryServicesRepoInterface get getCategoryServicesRepo {
    return CategoryServicesReposotory();
  }

  RegisterRepoInterface get getRegisterRepo {
    return RegisterReposotory();
  }

  LoginRepoInterface get getLoginRepo {
    return LoginReposotory();
  }

  UserProfileDetailsRepoInterface get getUserProfileDetailsRepo {
    return UserProfileDetailsReposotory();
  }
   ReceiveLocationRepoInterface get getReceiveLocationRepo {
    return ReceiveLocationReposotory();
  }
    BusStudentsRepoInterface get getBusStudentsRepo {
    return BusStudentsReposotory();
  }
   NotifyResponseRepoInterface get getNotifyResponseRepo {
    return NotifyResponseReposotory();
  }
  
}
