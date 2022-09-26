// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEntity _$FeedEntityFromJson(Map<String, dynamic> json) => FeedEntity(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      post_id: json['post_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      post: json['post'] == null
          ? null
          : PostEntity.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedEntityToJson(FeedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'post_id': instance.post_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'post': instance.post,
    };

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => PostEntity(
      id: json['id'] as int?,
      payload: json['payload'] == null
          ? null
          : PayloadEntity.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostEntityToJson(PostEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payload': instance.payload,
    };

PayloadEntity _$PayloadEntityFromJson(Map<String, dynamic> json) =>
    PayloadEntity(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      post_type: json['post_type'] as String?,
      description: json['description'] as String?,
      like_count: json['like_count'] as int?,
      comment_count: json['comment_count'] as int?,
      share_count: json['share_count'] as int?,
      created_at: json['created_at'] as String?,
      updated_atp: json['updated_atp'] as String?,
      is_like: json['is_like'] as bool?,
      nurseInfo: json['nurse_info'] == null
          ? null
          : NurseInfoEntity.fromJson(
              json['nurse_info'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      visibility: json['visibility'] == null
          ? null
          : VisibilityEntity.fromJson(
              json['visibility'] as Map<String, dynamic>),
      postMedia: (json['post_media'] as List<dynamic>?)
          ?.map((e) => PostMediaEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayloadEntityToJson(PayloadEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'post_type': instance.post_type,
      'description': instance.description,
      'like_count': instance.like_count,
      'comment_count': instance.comment_count,
      'share_count': instance.share_count,
      'created_at': instance.created_at,
      'updated_atp': instance.updated_atp,
      'is_like': instance.is_like,
      'nurse_info': instance.nurseInfo,
      'post_media': instance.postMedia,
      'user': instance.user,
      'visibility': instance.visibility,
    };

VisibilityEntity _$VisibilityEntityFromJson(Map<String, dynamic> json) =>
    VisibilityEntity(
      id: json['id'] as int?,
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$VisibilityEntityToJson(VisibilityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visibility': instance.visibility,
    };

NurseInfoEntity _$NurseInfoEntityFromJson(Map<String, dynamic> json) =>
    NurseInfoEntity(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      professional_title: json['professional_title'] as String?,
      profile_picture: json['profile_picture'] as String?,
      profile_picture_thumbnail: json['profile_picture_thumbnail'] as String?,
      cover_picture: json['cover_picture'] as String?,
      cover_picture_thumbnail: json['cover_picture_thumbnail'] as String?,
    );

Map<String, dynamic> _$NurseInfoEntityToJson(NurseInfoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'professional_title': instance.professional_title,
      'profile_picture': instance.profile_picture,
      'profile_picture_thumbnail': instance.profile_picture_thumbnail,
      'cover_picture': instance.cover_picture,
      'cover_picture_thumbnail': instance.cover_picture_thumbnail,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int?,
      email: json['email'] as String?,
      user_type: json['user_type'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'user_type': instance.user_type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

PostMediaEntity _$PostMediaEntityFromJson(Map<String, dynamic> json) =>
    PostMediaEntity(
      post_id: json['post_id'] as int?,
      media_url: json['media_url'] as String?,
      media_thumbnail: json['media_thumbnail'] as String?,
      media_height: (json['media_height'] as num?)?.toDouble(),
      media_width: (json['media_width'] as num?)?.toDouble(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PostMediaEntityToJson(PostMediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.post_id,
      'media_url': instance.media_url,
      'media_thumbnail': instance.media_thumbnail,
      'media_height': instance.media_height,
      'media_width': instance.media_width,
    };
