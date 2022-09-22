// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:domain/model/feed_data.dart';
import 'package:domain/utils/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_entity.g.dart';

@JsonSerializable()
class FeedEntity implements BaseLayerDataTransformer<FeedEntity, FeedData> {
  final int? id;
  final int? user_id;
  final int? post_id;
  final String? created_at;
  final String? updated_at;
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

  @override
  FeedEntity restore(FeedData data) {
    throw UnimplementedError();
  }

  @override
  FeedData transform() {
    return FeedData(
      id: id,
      user_id: user_id,
      post_id: post_id,
      postData: post!.transform(),
      created_at: created_at,
      updated_at: updated_at,
    );
  }
}

@JsonSerializable()
class Post implements BaseLayerDataTransformer<Post, PostData> {
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

  @override
  Post restore(PostData data) {
    throw UnimplementedError();
  }

  @override
  PostData transform() {
    return PostData(
      id: id,
      payloadData: payload!.transform(),
    );
  }
}

@JsonSerializable()
class Payload implements BaseLayerDataTransformer<Payload, PayloadData> {
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

  @override
  Payload restore(PayloadData data) {
    throw UnimplementedError();
  }

  @override
  PayloadData transform() {
    return PayloadData(
      id: id,
      userData: user!.transform(),
      user_id: user_id,
      post_type: post_type,
      description: description,
      like_count: like_count,
      comment_count: comment_count,
      share_count: share_count,
      created_at: created_at,
      updated_atp: updated_atp,
      is_like: is_like,
      nurse_infoData: nurseInfo!.transform(),
      visibilityData: visibility!.transform(),
      post_mediaData: postMedia?.map((e) => e.transform()).toList(),
    );
  }
}

@JsonSerializable()
class Visibility
    implements BaseLayerDataTransformer<Visibility, VisibilityData> {
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

  @override
  Visibility restore(VisibilityData data) {
    throw UnimplementedError();
  }

  @override
  VisibilityData transform() {
    return VisibilityData(id: id, visibility: visibility);
  }
}

@JsonSerializable()
class NurseInfo implements BaseLayerDataTransformer<NurseInfo, NurseInfoData> {
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

  @override
  NurseInfo restore(NurseInfoData data) {
    throw UnimplementedError();
  }

  @override
  NurseInfoData transform() {
    return NurseInfoData(
      id: id,
      user_id: user_id,
      first_name: first_name,
      last_name: last_name,
      email: email,
      professional_title: professional_title,
      profile_picture: profile_picture,
      profile_picture_thumbnail: profile_picture_thumbnail,
      cover_picture: cover_picture,
      cover_picture_thumbnail: cover_picture_thumbnail,
    );
  }
}

@JsonSerializable()
class User implements BaseLayerDataTransformer<User, UserData> {
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

  @override
  User restore(UserData data) {
    throw UnimplementedError();
  }

  @override
  UserData transform() {
    return UserData(
        id: id,
        email: email,
        user_type: user_type,
        created_at: created_at,
        updated_at: updated_at);
  }
}

@JsonSerializable()
class PostMedia implements BaseLayerDataTransformer<PostMedia, PostMediaData> {
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

  @override
  PostMedia restore(PostMediaData data) {
    throw UnimplementedError();
  }

  @override
  PostMediaData transform() {
    return PostMediaData(
        post_id: post_id,
        media_url: media_url,
        media_thumbnail: media_thumbnail,
        media_height: media_height,
        media_width: media_width);
  }
}
