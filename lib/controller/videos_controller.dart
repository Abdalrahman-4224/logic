import 'package:get/get.dart';
import 'package:logic_study/models/video.dart';
import 'package:logic_study/services/video_services.dart';

class Videos_Controller extends GetxController {
  Video_services Apiservices = Video_services();
  RxList<Video_Model> video = RxList<Video_Model>();
  @override
  void onInit() {
    getvideo();
    super.onInit();
  }

  Future<void> getvideo() async {
    try {
      dynamic videodata = Apiservices.fetchVideos();
      video.assignAll(videodata);
    } catch (e) {
      print('video controller error ');
    }
  }
}
