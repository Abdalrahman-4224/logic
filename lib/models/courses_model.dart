class Course_model {
  final String? id;
  final String? imageurl;
  final String? title;
  final int? coursePrice;
  final int? iscoursefree;
  final String? courseDescription;

  Course_model({
    required this.title,
    required this.id,
    required this.imageurl,
    required this.coursePrice,
    required this.iscoursefree,
    required this.courseDescription,
  });
  factory Course_model.fromJson(Map<String, dynamic> json) {
    return Course_model(
        id: json['_id'],
        imageurl: json['courseImg'],
        title: json['courseTitle'],
        coursePrice: json['coursePrice'],
        iscoursefree: json['coursePrice'],
        courseDescription: json['courseDescription']);
  }
}
