class Course_model {
  final String? id;
  final String? imageurl;
  final String? title;

  Course_model({
    required this.title,
    required this.id,
    required this.imageurl,
  });
  factory Course_model.fromJson(Map<String, dynamic> json) {
    return Course_model(
        id: json['_id'],
        imageurl: json['courseImg'],
        title: json['courseTitle']);
  }
}
