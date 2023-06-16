import 'package:dio/dio.dart';
import 'package:eclipse_tz/app/data/entities/post/post_entity.dart';
import 'package:eclipse_tz/app/domain/results/get_posts_by_user_id_result.dart';
import '../../helpers/app_error.dart';
import '../../helpers/catch_exception.dart';

class PostApi {
  final Dio dio;
  PostApi({required this.dio});

  Future<GetPostsByUserIdResult> getPostsByUserId(int userId) async {
    try {
      final response = await dio.get('/user/$userId/posts');
      return GetPostsByUserIdResult(
        posts: response.data
            .map<PostEntity>(
              (json) => PostEntity.fromJson(json),
            )
            .toList(),
      );
    }on Exception catch (error) {
      return GetPostsByUserIdResult(
        error: AppError(
          message: CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }
}
