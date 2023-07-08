class UniversitiesModel {
  final String title;
  final String id;
  final String imageurl;
  UniversitiesModel({
    required this.id,
    required this.imageurl,
    required this.title,
  });
  factory UniversitiesModel.fromjson(Map<String, dynamic> json) {
    return UniversitiesModel(
      title: json['title'],
      id: json['id'],
      imageurl: json['imageurl'],
    );
  }
}
