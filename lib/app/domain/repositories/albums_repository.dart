import '../results/get_albums_with_photos_repository.dart';

abstract class AlbumsRepository {
  Future<GetAlbumsWithPhotosByUserIdResult> getAlbumsWithPhotosByUserId(
      {required int userId});
}
