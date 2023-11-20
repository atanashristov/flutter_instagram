// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
      authorId: json['authorId'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      likes: json['likes'] as int? ?? 0,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'authorId': instance.authorId,
      'imageUrl': instance.imageUrl,
      'likes': instance.likes,
      'date': instance.date?.toIso8601String(),
    };
