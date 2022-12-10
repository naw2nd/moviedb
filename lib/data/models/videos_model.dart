import 'package:equatable/equatable.dart';
import 'package:moviedb/domain/entities/video.dart';

class VideosResponse extends Equatable {
  const VideosResponse({
    required this.id,
    required this.results,
  });

  final int id;
  final List<VideoModel> results;

  factory VideosResponse.fromJson(Map<String, dynamic> json) => VideosResponse(
        id: json["id"],
        results: List<VideoModel>.from((json["results"] as List)
            .map((x) => VideoModel.fromJson(x))
            .where(
                (video) => video.site == 'YouTube' && video.type == 'Trailer')),
      );

  List<Video> toEntity() => results.map((video) => video.toEntity()).toList();

  @override
  List<Object?> get props => [
        id,
        results,
      ];
}

class VideoModel extends Equatable {
  const VideoModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );
  Video toEntity() => Video(
        iso6391: iso6391,
        iso31661: iso31661,
        name: name,
        key: key,
        site: site,
        size: size,
        type: type,
        official: official,
        publishedAt: publishedAt,
        id: id,
      );
  @override
  List<Object?> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];
}
