//هنا ال backend من اجيبه من حسن

class Video_Model {
  final String id;
  final String title;
  final String videoUrl;
  final String imageurl;
  final int duration;

  Video_Model({
    required this.id,
    required this.title,
    required this.imageurl,
    required this.videoUrl,
    required this.duration,
  });

  factory Video_Model.fromJson(Map<String, dynamic> json) {
    return Video_Model(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      imageurl: json['imageurl'],
      duration: json['duration'],
    );
  }
}
