// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
      author: json['author'] == null
          ? User.empty
          : User.fromJson(json['author'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
      likes: json['likes'] as int? ?? 0,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'author': instance.author,
      'imageUrl': instance.imageUrl,
      'likes': instance.likes,
      'date': instance.date?.toIso8601String(),
    };
