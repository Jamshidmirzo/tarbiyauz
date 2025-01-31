class TwitModel {
  final String id;
  final String userId;
  final String publisherFio;
  final String type;
  final String texts;
  final String title;
  final int readersCount;
  final String createdAt;
  final List<VideoModel> videos;
  final List<PhotoModel> photos;
  final List<MusicModel> musics;
  final String? locations;
  final String? urls;

  TwitModel({
    required this.id,
    required this.userId,
    required this.publisherFio,
    required this.type,
    required this.texts,
    required this.title,
    required this.readersCount,
    required this.createdAt,
    this.videos = const [],
    this.photos = const [],
    this.musics = const [],
    this.locations,
    this.urls,
  });

  factory TwitModel.fromJson(Map<String, dynamic> json) {
    return TwitModel(
      id: json['id'],
      userId: json['user_id'],
      publisherFio: json['publisher_fio'],
      type: json['type'],
      texts: json['texts'],
      title: json['title'],
      readersCount: json['readers_count'],
      createdAt: json['created_at'],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((video) => VideoModel.fromJson(video))
              .toList() ??
          [],
      photos: (json['photos'] as List<dynamic>?)
              ?.map((photo) => PhotoModel.fromJson(photo))
              .toList() ??
          [],
      musics: (json['musics'] as List<dynamic>?)
              ?.map((music) => MusicModel.fromJson(music))
              .toList() ??
          [],
      locations: json['locations'],
      urls: json['urls'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'publisher_fio': publisherFio,
      'type': type,
      'texts': texts,
      'title': title,
      'readers_count': readersCount,
      'created_at': createdAt,
      'videos': videos.map((video) => video.toJson()).toList(),
      'photos': photos.map((photo) => photo.toJson()).toList(),
      'musics': musics.map((music) => music.toJson()).toList(),
      'locations': locations,
      'urls': urls,
    };
  }
}

class VideoModel {
  final String videoId;
  final String videoUrl;

  VideoModel({
    required this.videoId,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoId: json['video_id'],
      videoUrl: json['video_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video_id': videoId,
      'video_url': videoUrl,
    };
  }
}

class PhotoModel {
  final String photoId;
  final String photoUrl;

  PhotoModel({
    required this.photoId,
    required this.photoUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      photoId: json['photo_id'],
      photoUrl: json['photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo_id': photoId,
      'photo_url': photoUrl,
    };
  }
}

class MusicModel {
  final String musicId;
  final String musicUrl;

  MusicModel({
    required this.musicId,
    required this.musicUrl,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      musicId: json['music_id'],
      musicUrl: json['music_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'music_id': musicId,
      'music_url': musicUrl,
    };
  }
}
