import 'package:get/get.dart';
import 'package:logic_study/services/branches_services.dart';
import 'package:logic_study/models/branches_model.dart';

class BranchesController extends GetxController {
  final BranchesServices apiService = BranchesServices();
  RxList<dynamic>? branchesList; // Declare the list as nullable

  @override
  void onInit() {
    fetchbranches();
    super.onInit();
  }

  Future<void> fetchbranches() async {
    try {
      final branchdata = await apiService.fetchBranches();
      print("branches_controller************************$branchdata");
      if (branchdata != null) {
        // Assign the list only if it's not null
        branchesList = branchdata.obs;
      } else {
        // Handle the null case here (e.g., show an error message or fallback)
      }
    } catch (error) {
      print(
          '---------------------------error------------------------(branches_controller)');
      // Handle error
      print('Failed to fetch branch: $error');
    }
  }
}
