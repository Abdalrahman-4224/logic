import 'package:get/get.dart';
import 'package:logic_study/services/branches_services.dart';
import 'package:logic_study/models/branches_model.dart';

class BranchesController extends GetxController {
  final BranchesServices apiService =
      BranchesServices(); //  API service instance
  late RxList<BranchesModel> branches = RxList(); // Reactive list of courses
  @override
  void onInit() {
    fetchbranches();
    super.onInit();
  }

  Future<void> fetchbranches() async {
    try {
      final branchdata = await apiService.fetchBranches();
      branches.assignAll(branchdata);
    } catch (error) {
      // Handle error
      print('Failed to fetch branch: $error');
    }
  }
}
