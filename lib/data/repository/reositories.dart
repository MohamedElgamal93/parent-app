import '../request/request.dart';

class Repositories {
  final RequestsRepository requestsRepository;

  Repositories(this.requestsRepository);



  Future<dynamic> onBoarding() async {
  //  final dynamic = await requestsRepository.onBoarding();
  //   return dynamic;
  }

  Future<dynamic> defaultSettings() async {
    // var response = await requestsRepository.defaultSettings();
    // return response;
  }

  Future<dynamic> getChangeSetting() async {
    // final dynamic = await requestsRepository.getChangeSetting();
    // return dynamic;
  }
}
