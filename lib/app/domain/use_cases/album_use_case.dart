import 'package:eclipse_tz/app/domain/repositories/albums_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_albums_with_photos_repository.dart';

class AlbumUseCase {
  final AlbumsRepository repository;

  AlbumUseCase({
    required this.repository,
  });

  Future<GetAlbumsWithPhotosByUserIdResult> getAlbumsWithPhotosByUserIdResult(int userId) async {
    final result = await repository.getAlbumsWithPhotosByUserId(userId: userId);

    return result;
  }
}
