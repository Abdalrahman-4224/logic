import 'package:get/get.dart';
import 'package:logic_study/models/colleges_model.dart';
import 'package:logic_study/services/colleges_services.dart';

class BranchesController extends GetxController {
  final CollegesServices apiService =
      CollegesServices(); //  API service instance
  late RxList<Colleges_model> colleges = RxList(); // Reactive list of courses
  @override
  void onInit() {
    fetchbranches();
    super.onInit();
  }

  Future<void> fetchbranches() async {
    try {
      final collegedata = await apiService.fetchcolleges();
      colleges.assignAll(collegedata);
    } catch (error) {
      // Handle error
      print('Failed to fetch branch: $error');
    }
  }
}
