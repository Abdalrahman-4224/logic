import 'package:get/get.dart';
import 'package:logic_study/models/video_model.dart';
import 'package:logic_study/services/video_services.dart';

class Videos_Controller extends GetxController {
  Video_services apiservices = Video_services();
  Rx<Video_model> video = Rx<Video_model>(Video_model()); // Add initial value

  @override
  void onInit() {
    fetchvideos();
    super.onInit();
  }

  Future<void> fetchvideos() async {
    final videodata = await apiservices.fetchVideos();
    video.value = videodata;
  }
}
