import 'package:video_player/video_player.dart';

late String Curl;
String vselectedResolution = '480p';
List<String> vresolutions = ['480p', '720p', '1080p'];
VideoPlayerController Ccontroller = VideoPlayerController.network(Curl);
String Cid = '';

class ConstantVars {
  static String username = "";
  static String password = "";
  static String email = "";
  static String confirmedpassowrd = "";
}
