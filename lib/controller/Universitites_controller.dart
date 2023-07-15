import 'package:get/get.dart';
import 'package:logic_study/services/Universitites_services.dart';
import 'package:logic_study/models/university_model.dart';

class UniversititesController extends GetxController {
  final Universitites_services apiService =
      Universitites_services(); //  API service instance
  late RxList<UniversitiesModel>? universitiesList =
      RxList(); // Reactive list of courses
  @override
  void onInit() {
    fetchUniversities();
    super.onInit();
  }

  Future<void> fetchUniversities() async {
    try {
      final universities = await apiService.fetchuniversitites();
      universitiesList?.assignAll(universities);
    } catch (error) {
      // Handle error
      print(
          '-----------------------error-----------------(universitites_controller)');
      print('Failed to fetch university: $error');
    }
  }
}
