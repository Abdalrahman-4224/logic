import 'package:video_player/video_player.dart';

late String Curl;
String vselectedResolution = '480p';
List<String> vresolutions = ['480p', '720p', '1080p'];
VideoPlayerController Ccontroller = VideoPlayerController.network(Curl);
bool cisfree = true;
const String api = 'https://dashboard.logic-study.com/api';

class Choices {
  static String collegeid = '';
  static String branchid = '';
  static String universityid = '';
}

class Course {
  static String? cid = '';
  static String? courseDes = '';
  static int? isfree = null;
  static int? coursePrice = null;
  static String? tittle = '';
}

class ConstantVars {
  static String? username = '';
  static String? password = '';
  static String? email = '';
  static String? confirmedpassowrd = '';
}
