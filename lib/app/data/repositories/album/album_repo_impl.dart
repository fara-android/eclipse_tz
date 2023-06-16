import 'package:eclipse_tz/app/data/repositories/api_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/albums_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_albums_with_photos_repository.dart';
import '../../helpers/app_error.dart';

class AlbumRepoImpl implements AlbumsRepository {
  final ApiRepository repository;

  AlbumRepoImpl({required this.repository});

  @override
  Future<GetAlbumsWithPhotosByUserIdResult> getAlbumsWithPhotosByUserId({
    required int userId,
  }) async {
    final result =
        await repository.albumsApi.getAlbumsWithPhotosByUserId(userId);

    if (result.error == null) {
      return GetAlbumsWithPhotosByUserIdResult(albums: result.albums!);
    } else {
      return GetAlbumsWithPhotosByUserIdResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }
}
