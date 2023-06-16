import 'package:eclipse_tz/app/data/repositories/api_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/comment_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_comments_by_post_id_result.dart';
import 'package:eclipse_tz/app/domain/results/send_comment_result.dart';
import '../../helpers/app_error.dart';

class CommentRepoImpl implements CommentRepository {
  final ApiRepository repository;

  CommentRepoImpl({required this.repository});

  @override
  Future<GetCommentsByPostIdResult> getCommentsByPostId(
      {required int postId}) async {
    final result = await repository.commentApi.getCommentsByPostId(postId);

    if (result.error == null) {
      return GetCommentsByPostIdResult(comments: result.comments!);
    } else {
      return GetCommentsByPostIdResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }

  @override
  Future<SendCommentResult> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    final result = await repository.commentApi.sendComment(
      body: body,
      email: email,
      name: name,
    );

    if (result.error == null) {
      return SendCommentResult(success: true);
    } else {
      return SendCommentResult(
          error: AppError(
        message: result.error!.message,
        code: result.error!.code,
      ));
    }
  }
}
