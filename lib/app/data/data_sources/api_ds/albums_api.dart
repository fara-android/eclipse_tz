import 'package:dio/dio.dart';
import 'package:eclipse_tz/app/data/entities/album_with_photos/album_with_photos_entity.dart';
import 'package:eclipse_tz/app/domain/results/get_albums_with_photos_repository.dart';
import '../../helpers/app_error.dart';
import '../../helpers/catch_exception.dart';

class AlbumsApi {
  final Dio dio;
  AlbumsApi({required this.dio});

  Future<GetAlbumsWithPhotosByUserIdResult> getAlbumsWithPhotosByUserId(
      int userId) async {
    try {
      final response = await dio.get('/user/$userId/albums?_embed=photos');
      return GetAlbumsWithPhotosByUserIdResult(
        albums: response.data
            .map<AlbumWithPhotosEntity>(
              (json) => AlbumWithPhotosEntity.fromJson(json),
            )
            .toList(),
      );
    } catch (error) {
      return GetAlbumsWithPhotosByUserIdResult(
        error: AppError(
          message: CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }
}
