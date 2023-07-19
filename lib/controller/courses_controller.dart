import 'package:get/get.dart';
import 'package:logic_study/models/courses_model.dart';
import 'package:logic_study/services/courses_services.dart';

class Coursecontroller extends GetxController {
  final Courseservices apiService = Courseservices(); //  API service instance
  late RxList<Course_model>? courses =
      RxList<Course_model>(); // Reactive list of courses
  @override
  void onInit() {
    fetchCourses();
    print(courses);
    super.onInit();
  }

  Future<void> fetchCourses() async {
    print('coursescontroller called');

    try {
      final coursesData = await apiService.fetchcourses();
      courses?.assignAll(coursesData);
      print(courses);
    } catch (error) {
      // Handle error
      print('Failed to fetch courses: $error');
    }
  }
}
