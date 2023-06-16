import 'package:eclipse_tz/app/domain/repositories/comment_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_comments_by_post_id_result.dart';
import 'package:eclipse_tz/app/domain/results/send_comment_result.dart';

class CommentUseCase {
  final CommentRepository repository;

  CommentUseCase({
    required this.repository,
  });

  Future<GetCommentsByPostIdResult> getCommentsByPostId(int postId) async {
    final result = await repository.getCommentsByPostId(postId: postId);

    return result;
  }

  Future<SendCommentResult> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    final result = await repository.sendComment(
      email: email,
      name: name,
      body: body,
    );

    return result;
  }
}
