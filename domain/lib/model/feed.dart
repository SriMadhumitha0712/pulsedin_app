// ignore_for_file: non_constant_identifier_names

class Feed {
  final int? id;
  final int? user_id;
  final int? post_id;
  final String? created_at;
  final String? updated_at;
  final Post? post;

  Feed({
    this.id,
    this.user_id,
    this.post_id,
    this.created_at,
    this.updated_at,
    this.post,
  });
}

class Post {
  final int? id;
  Payload? payload;

  Post({
    this.id,
    this.payload,
  });
}

class Payload {
  final int? id;
  final int? user_id;
  final String? post_type;
  final String? description;
  final int? like_count;
  final int? comment_count;
  final int? share_count;
  final String? created_at;
  final String? updated_atp;
  bool? is_like;
  NurseInfo? nurse_info;
  List<PostMedia>? post_media;
  User? user;
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
    this.post_media,
    this.nurse_info,
    this.user,
    this.visibility,
  });
}

class Visibility {
  final int? id;
  final String? visibility;

  Visibility({
    this.id,
    this.visibility,
  });
}

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
}

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
}

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
}
