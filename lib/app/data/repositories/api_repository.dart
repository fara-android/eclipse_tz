import 'package:dio/dio.dart';
import 'package:eclipse_tz/app/data/data_sources/api_ds/users_api.dart';
import '../data_sources/api_ds/albums_api.dart';
import '../data_sources/api_ds/comment_api.dart';
import '../data_sources/api_ds/post_api.dart';
import '../helpers/dio_settings.dart';

class ApiRepository {
  ApiRepository() {
    _dio = _getDio();

    /// ИНИЦИАЛИЗИЯ РЕПОЗИТОРИЕВ
    usersApi = UsersApi(
      dio: _dio,
    );
    postApi = PostApi(
      dio: _dio,
    );
    commentApi = CommentApi(
      dio: _dio,
    );
    albumsApi = AlbumsApi(
      dio: _dio,
    );
  }

  late Dio _dio;
  late UsersApi usersApi;
  late PostApi postApi;
  late CommentApi commentApi;
  late AlbumsApi albumsApi;

  Dio _getDio() {
    final apiSettings = DioSettings();
    return apiSettings.dio;
  }
}
