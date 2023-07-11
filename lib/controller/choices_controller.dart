import 'package:get/get.dart';
import 'package:logic_study/services/choices_post_services.dart';
import 'package:logic_study/constant.dart';
import 'package:logic_study/view/homepage_screen/temprorary_hompage_screen.dart';
import 'package:logic_study/view/homepage_screen/temprorary_hompage_screen.dart';
import 'package:logic_study/widgets/cards.dart';

class ChoicesController extends GetxController {
  RxBool isloading = false.obs;
  ChoicesServices Cservices = ChoicesServices();
  void handlechoices() {
    Cservices.postchoices(
            Choices.collegeid, Choices.branchid, Choices.universityid)
        .then((success) {
      if (success) {
        Get.to(TemproraryHompageScreen());
      } else {
        mydialog(title: 'خطأ في الخادم', error: "خطأ في الخادم حاول لاحقاً");
        print(
            '---------------------------error---------------------------------------------error in (choices_controller) on line 19');

        // Handle login failure
        // Display error message or perform any necessary actions
      }
    }).catchError((error) async {
      isloading.value = false;
      print(
          '---------------------------error---------------------------------------------error in (choices_controller) on line 21');
      await mydialog(
          title: 'خطأ في الخادم', error: "خطأ في الخادم حاول لاحقاً");
    }).whenComplete(() {
      isloading.value = false;
    });
  }
}
