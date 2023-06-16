import 'package:eclipse_tz/app/data/repositories/api_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/post_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_posts_by_user_id_result.dart';

import '../../helpers/app_error.dart';

class PostRepoImpl implements PostRepository {
  final ApiRepository repository;

  PostRepoImpl({required this.repository});

  @override
  Future<GetPostsByUserIdResult> getPostsByUserId({required int userId}) async {
    final result = await repository.postApi.getPostsByUserId(userId);

    if (result.error == null) {
      return GetPostsByUserIdResult(posts: result.posts!);
    } else {
      return GetPostsByUserIdResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }
}
