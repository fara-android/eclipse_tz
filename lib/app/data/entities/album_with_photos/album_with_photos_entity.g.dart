// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_with_photos_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumWithPhotosEntity _$$_AlbumWithPhotosEntityFromJson(
        Map<String, dynamic> json) =>
    _$_AlbumWithPhotosEntity(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumWithPhotosEntityToJson(
        _$_AlbumWithPhotosEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
    };
