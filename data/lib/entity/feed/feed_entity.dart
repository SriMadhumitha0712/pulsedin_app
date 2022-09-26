// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:domain/model/feeds_data.dart';
import 'package:domain/utils/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_entity.g.dart';

@JsonSerializable()
class FeedEntity implements BaseLayerDataTransformer<FeedEntity, Feed> {
  final int? id;
  final int? user_id;
  final int? post_id;
  final String? created_at;
  final String? updated_at;
  PostEntity? post;

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
  FeedEntity restore(Feed data) {
    throw UnimplementedError();
  }

  @override
  Feed transform() {
    return Feed(
      created_at: created_at,
      id: id,
      user_id: user_id,
      post_id: post_id,
      post: post!.transform(),
    );
  }
}

@JsonSerializable()
class PostEntity implements BaseLayerDataTransformer<PostEntity, Post> {
  final int? id;
  @JsonKey(name: 'payload')
  PayloadEntity? payload;

  PostEntity({
    this.id,
    this.payload,
  });

  @override
  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PostEntityToJson(this);

  @override
  PostEntity restore(Post data) {
    throw UnimplementedError();
  }

  @override
  Post transform() {
    Post(id: id, payload: payload!.transform());
    throw UnimplementedError();
  }
}

@JsonSerializable()
class PayloadEntity
    implements BaseLayerDataTransformer<PayloadEntity, Payload> {
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
  NurseInfoEntity? nurseInfo;
  @JsonKey(name: 'post_media')
  List<PostMediaEntity>? postMedia;
  @JsonKey(name: 'user')
  UserEntity? user;
  @JsonKey(name: 'visibility')
  VisibilityEntity? visibility;

  PayloadEntity({
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
  factory PayloadEntity.fromJson(Map<String, dynamic> json) =>
      _$PayloadEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadEntityToJson(this);

  @override
  PayloadEntity restore(Payload data) {
    throw UnimplementedError();
  }

  @override
  Payload transform() {
    return Payload(
      id: id,
      user_id: user_id,
      post_type: post_type,
      description: description,
      like_count: like_count,
      comment_count: comment_count,
      share_count: share_count,
      created_at: created_at,
      updated_atp: updated_atp,
      is_like: is_like,
      nurse_info: nurseInfo!.transform(),
      user: user!.transform(),
      visibility: visibility!.transform(),
      post_media: postMedia!.map((e) => e.transform()).toList(),
    );
  }
}

@JsonSerializable()
class VisibilityEntity
    implements BaseLayerDataTransformer<VisibilityEntity, Visibility> {
  final int? id;
  final String? visibility;

  VisibilityEntity({
    this.id,
    this.visibility,
  });

  @override
  factory VisibilityEntity.fromJson(Map<String, dynamic> json) =>
      _$VisibilityEntityFromJson(json);
  Map<String, dynamic> toJson() => _$VisibilityEntityToJson(this);

  @override
  VisibilityEntity restore(Visibility data) {
    throw UnimplementedError();
  }

  @override
  Visibility transform() {
    return Visibility(id: id, visibility: visibility);
  }
}

@JsonSerializable()
class NurseInfoEntity
    implements BaseLayerDataTransformer<NurseInfoEntity, NurseInfo> {
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

  NurseInfoEntity({
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
  factory NurseInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$NurseInfoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$NurseInfoEntityToJson(this);

  @override
  NurseInfoEntity restore(NurseInfo data) {
    throw UnimplementedError();
  }

  @override
  NurseInfo transform() {
    return NurseInfo(
        id: id,
        user_id: user_id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        professional_title: professional_title,
        profile_picture: profile_picture,
        profile_picture_thumbnail: profile_picture_thumbnail,
        cover_picture: cover_picture,
        cover_picture_thumbnail: cover_picture_thumbnail);
  }
}

@JsonSerializable()
class UserEntity implements BaseLayerDataTransformer<UserEntity, User> {
  final int? id;
  final String? email;
  final String? user_type;
  final String? created_at;
  final String? updated_at;

  UserEntity({
    this.id,
    this.email,
    this.user_type,
    this.created_at,
    this.updated_at,
  });

  @override
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  UserEntity restore(User data) {
    throw UnimplementedError();
  }

  @override
  User transform() {
    return User(
      id: id,
      email: email,
      user_type: user_type,
      created_at: created_at,
      updated_at: updated_at,
    );
  }
}

@JsonSerializable()
class PostMediaEntity
    implements BaseLayerDataTransformer<PostMediaEntity, PostMedia> {
  final int? id;
  final int? post_id;
  final String? media_url;
  final String? media_thumbnail;
  final double? media_height;
  final double? media_width;

  PostMediaEntity({
    this.post_id,
    this.media_url,
    this.media_thumbnail,
    this.media_height,
    this.media_width,
    this.id,
  });

  @override
  factory PostMediaEntity.fromJson(Map<String, dynamic> json) =>
      _$PostMediaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PostMediaEntityToJson(this);

  @override
  PostMediaEntity restore(PostMedia data) {
    throw UnimplementedError();
  }

  @override
  PostMedia transform() {
    return PostMedia(
        post_id: post_id,
        id: id,
        media_url: media_url,
        media_thumbnail: media_thumbnail,
        media_height: media_height,
        media_width: media_width);
  }
}
