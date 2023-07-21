import 'package:get/get.dart';
import 'package:logic_study/models/onecourse_model.dart';
import 'package:logic_study/services/onecoursebyId_services.dart';

class Videos_Controller extends GetxController {
  OneCoursebyId apiservices = OneCoursebyId();
  Rx<OneCourseModel> video =
      Rx<OneCourseModel>(OneCourseModel()); // Add initial value

  @override
  void onInit() {
    fetchvideos();
    super.onInit();
  }

  Future<void> fetchvideos() async {
    final videodata = await apiservices.fetchonecourse();
    video.value = videodata;
  }
}
