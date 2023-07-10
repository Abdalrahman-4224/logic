import 'package:get/get.dart';
import 'package:logic_study/models/colleges_model.dart';
import 'package:logic_study/services/colleges_services.dart';

class CollegesController extends GetxController {
  final CollegesServices apiService =
      CollegesServices(); //  API service instance
  late RxList<Colleges_model>? collegesList =
      RxList(); // Reactive list of colleges
  @override
  void onInit() {
    fetchcolleges();
    super.onInit();
  }

  Future<void> fetchcolleges() async {
    try {
      final collegedata = await apiService.fetchcolleges();
      collegesList?.assignAll(collegedata);
    } catch (error) {
      // Handle error
      print('Failed to fetch colleges: $error');
    }
  }
}
