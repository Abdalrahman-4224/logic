class Colleges_model {
  final String collegetitle;
  final String collegeid;
  Colleges_model({
    required this.collegeid,
    required this.collegetitle,
  });
  factory Colleges_model.fromjson(Map<String, dynamic> json) {
    return Colleges_model(collegeid: json['id'], collegetitle: json['title']);
  }
}
