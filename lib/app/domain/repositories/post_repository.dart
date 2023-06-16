import 'package:eclipse_tz/app/domain/results/get_posts_by_user_id_result.dart';

abstract class PostRepository {
  Future<GetPostsByUserIdResult> getPostsByUserId({required int userId});
}
