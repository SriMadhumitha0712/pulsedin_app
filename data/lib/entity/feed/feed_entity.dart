// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'feed_entity.g.dart';

@JsonSerializable()
class FeedEntity {
  final int? id;
  final int? user_id;
  final int? post_id;
  final String? created_at;
  final String? updated_at;
  @JsonKey(name: 'post')
  Post? post;

  FeedEntity({
    this.id,
    this.user_id,
    this.post_id,
    this.created_at,
    this.updated_at,
    this.post,
  });

  @override
  factory FeedEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FeedEntityToJson(this);
}

@JsonSerializable()
class Post {
  final int? id;
  @JsonKey(name: 'payload')
  Payload? payload;

  Post({
    this.id,
    this.payload,
  });

  @override
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Payload {
  final int? id;
  final int? user_id;
  final String? post_type;
  final String? description;
  int? like_count;
  final int? comment_count;
  final int? share_count;
  final String? created_at;
  final String? updated_atp;
  bool? is_like;
  @JsonKey(name: 'nurse_info')
  NurseInfo? nurseInfo;
  @JsonKey(name: 'post_media')
  List<PostMedia>? postMedia;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'visibility')
  Visibility? visibility;

  Payload({
    this.id,
    this.user_id,
    this.post_type,
    this.description,
    this.like_count,
    this.comment_count,
    this.share_count,
    this.created_at,
    this.updated_atp,
    this.is_like,
    this.nurseInfo,
    this.user,
    this.visibility,
    this.postMedia,
  });

  @override
  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

@JsonSerializable()
class Visibility {
  final int? id;
  final String? visibility;

  Visibility({
    this.id,
    this.visibility,
  });

  @override
  factory Visibility.fromJson(Map<String, dynamic> json) =>
      _$VisibilityFromJson(json);
  Map<String, dynamic> toJson() => _$VisibilityToJson(this);
}

@JsonSerializable()
class NurseInfo {
  final int? id;
  final int? user_id;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? professional_title;
  final String? profile_picture;
  final String? profile_picture_thumbnail;
  final String? cover_picture;
  final String? cover_picture_thumbnail;

  NurseInfo({
    this.id,
    this.user_id,
    this.first_name,
    this.last_name,
    this.email,
    this.professional_title,
    this.profile_picture,
    this.profile_picture_thumbnail,
    this.cover_picture,
    this.cover_picture_thumbnail,
  });

  @override
  factory NurseInfo.fromJson(Map<String, dynamic> json) =>
      _$NurseInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NurseInfoToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String? email;
  final String? user_type;
  final String? created_at;
  final String? updated_at;

  User({
    this.id,
    this.email,
    this.user_type,
    this.created_at,
    this.updated_at,
  });

  @override
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class PostMedia {
  final int? id;
  final int? post_id;
  final String? media_url;
  final String? media_thumbnail;
  final double? media_height;
  final double? media_width;

  PostMedia({
    this.post_id,
    this.media_url,
    this.media_thumbnail,
    this.media_height,
    this.media_width,
    this.id,
  });

  @override
  factory PostMedia.fromJson(Map<String, dynamic> json) =>
      _$PostMediaFromJson(json);
  Map<String, dynamic> toJson() => _$PostMediaToJson(this);
}
