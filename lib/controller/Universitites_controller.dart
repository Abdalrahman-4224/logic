import 'package:get/get.dart';
import 'package:logic_study/services/Universitites_services.dart';
import 'package:logic_study/models/university_model.dart';

class UniversititesController extends GetxController {
  final Universitites_services apiService = Universitites_services();
  RxList<UniversitiesModel> universitiesList = RxList<UniversitiesModel>();

  @override
  void onInit() {
    CfetchUniversities();

    super.onInit();
  }

  Future<void> CfetchUniversities() async {
    final List<UniversitiesModel> universities =
        await apiService.fetchuniversitites();

    universitiesList.assignAll(universities);

    print('************universitycontroller$universities');
  }
}
