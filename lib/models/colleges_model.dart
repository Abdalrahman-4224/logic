class Colleges_model {
  final String? colleageName;
  final String? id;
  Colleges_model({
    required this.colleageName,
    required this.id,
  });
  factory Colleges_model.fromjson(Map<String, dynamic> json) {
    return Colleges_model(id: json['_id'], colleageName: json['colleageName']);
  }
}
