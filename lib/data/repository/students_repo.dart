
import 'package:scostudent/data/api/api_client.dart';
import '../model/response_model/students/students_list.dart';

class BusStudentsReposotory implements BusStudentsRepoInterface {
  @override
  Future<BusStudents> busStudents(
     dynamic url) async {
    return await getCallServiceExperties(
        url, RequestType.busStudents);
  }
}
