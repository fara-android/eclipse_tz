import 'package:eclipse_tz/app/domain/results/get_comments_by_post_id_result.dart';
import 'package:eclipse_tz/app/domain/results/send_comment_result.dart';

abstract class CommentRepository {
  Future<GetCommentsByPostIdResult> getCommentsByPostId({required int postId});

  Future<SendCommentResult> sendComment({
    required String name,
    required String email,
    required String body,
  });
}
