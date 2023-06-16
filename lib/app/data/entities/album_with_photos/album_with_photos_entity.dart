import 'package:eclipse_tz/app/data/entities/photo/photo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_with_photos_entity.freezed.dart';
part 'album_with_photos_entity.g.dart';

@freezed
class AlbumWithPhotosEntity with _$AlbumWithPhotosEntity {
  factory AlbumWithPhotosEntity({
    required int userId,
    required int id,
    required String title,
    required List<PhotoEntity> photos,
  }) = _AlbumWithPhotosEntity;

  factory AlbumWithPhotosEntity.fromJson(Map<String, dynamic> json) =>
      _$AlbumWithPhotosEntityFromJson(json);
}
