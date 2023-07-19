class UniversitiesModel {
  final String? universityName;
  final String? id;
  final String? universityImgUrl;

  UniversitiesModel({
    required this.id,
    required this.universityImgUrl,
    required this.universityName,
  });

  factory UniversitiesModel.fromJson(Map<String, dynamic> json) {
    return UniversitiesModel(
      universityName: json['universityName'],
      id: json['_id'],
      universityImgUrl: json['universityImgUrl'], // Corrected the key here
    );
  }
}
