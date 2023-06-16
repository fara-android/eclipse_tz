import 'package:eclipse_tz/app/domain/repositories/post_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_posts_by_user_id_result.dart';

class PostUseCase {
  final PostRepository repository;

  PostUseCase({
    required this.repository,
  });

  Future<GetPostsByUserIdResult> getPostsByUserId(int userId) async {
    final result = await repository.getPostsByUserId(userId: userId);

    return result;
  }
}
