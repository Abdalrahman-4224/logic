class VideoModel {
  final String? id;
  final String? videoTitle;
  final String? videoDescription;
  final String? videoImgUrl;
  final String? videoUrl;
  final int? videoSequence;
  final String? videoChapter;
  final int? videoDuration;
  final bool? isVideoFree;
  final String? videoCourse;
  final String? createdAt;

  VideoModel({
    this.id,
    this.videoTitle,
    this.videoDescription,
    this.videoImgUrl,
    this.videoUrl,
    this.videoSequence,
    this.videoChapter,
    this.videoDuration,
    this.isVideoFree,
    this.videoCourse,
    this.createdAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['_id'],
      videoTitle: json['videoTitle'],
      videoDescription: json['videoDescription'],
      videoImgUrl: json['videoImgUrl'],
      videoUrl: json['videoUrl'],
      videoSequence: json['videoSequence'],
      videoChapter: json['videoChapter'],
      videoDuration: json['videoDuration'],
      isVideoFree: json['isVideoFree'],
      videoCourse: json['videoCourse'],
      createdAt: json['createdAt'],
    );
  }
}
