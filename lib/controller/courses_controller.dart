import 'package:get/get.dart';
import 'package:logic_study/models/courses_model.dart';
import 'package:logic_study/services/courses_services.dart';

class Coursecontroller extends GetxController {
  final Courseservices apiService = Courseservices(); //  API service instance
  late RxList<Course_model> courses = RxList(); // Reactive list of courses
  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  Future<void> fetchCourses() async {
    try {
      final coursesData = await apiService.fetchcourses();
      courses.assignAll(coursesData);
    } catch (error) {
      // Handle error
      print('Failed to fetch courses: $error');
    }
  }
}
