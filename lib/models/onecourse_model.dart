class OneCourseModel {
  final String? id;
  final String? courseImg;
  final String? courseTitle;
  final String? courseChapter;
  final int? coursePrice;
  final bool? isCourseFree;
  final String? courseDescription;
  final String? courseTeacher;
  final String? courseUniversityName;
  final String? courseColleageName;
  final String? courseBranchName;
  final String? courseStage;
  final String? branch;
  final List<String>? courseVideos;
  final int? v;

  OneCourseModel({
    this.id,
    this.courseImg,
    this.courseTitle,
    this.courseChapter,
    this.coursePrice,
    this.isCourseFree,
    this.courseDescription,
    this.courseTeacher,
    this.courseUniversityName,
    this.courseColleageName,
    this.courseBranchName,
    this.courseStage,
    this.branch,
    this.courseVideos,
    this.v,
  });

  factory OneCourseModel.fromJson(Map<String, dynamic> json) {
    return OneCourseModel(
      id: json['_id'],
      courseImg: json['courseImg'],
      courseTitle: json['courseTitle'],
      courseChapter: json['courseChapter'],
      coursePrice: json['coursePrice'],
      isCourseFree: json['isCourseFree'],
      courseDescription: json['courseDescription'],
      courseTeacher: json['courseTeacher'],
      courseUniversityName: json['courseUniversityName'],
      courseColleageName: json['courseColleageName'],
      courseBranchName: json['courseBranchName'],
      courseStage: json['courseStage'],
      branch: json['branch'],
      courseVideos: List<String>.from(json['courseVideos']),
      v: json['__v'],
    );
  }
}
