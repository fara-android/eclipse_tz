import 'package:eclipse_tz/app/data/entities/album_with_photos/album_with_photos_entity.dart';

import '../../data/helpers/app_error.dart';

class GetAlbumsWithPhotosByUserIdResult {
  GetAlbumsWithPhotosByUserIdResult({
    this.error,
    this.albums,
  });

  final AppError? error;
  final List<AlbumWithPhotosEntity>? albums;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $albums)';
}