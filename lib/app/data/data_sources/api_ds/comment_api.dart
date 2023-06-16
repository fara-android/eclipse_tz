import 'package:dio/dio.dart';
import 'package:eclipse_tz/app/data/entities/comment/comment_entity.dart';
import 'package:eclipse_tz/app/domain/results/get_comments_by_post_id_result.dart';
import 'package:eclipse_tz/app/domain/results/send_comment_result.dart';
import '../../helpers/app_error.dart';
import '../../helpers/catch_exception.dart';

class CommentApi {
  final Dio dio;
  CommentApi({required this.dio});

  Future<GetCommentsByPostIdResult> getCommentsByPostId(int postId) async {
    try {
      final response = await dio.get('/posts/$postId/comments/');
      return GetCommentsByPostIdResult(
        comments: response.data
            .map<CommentEntity>(
              (json) => CommentEntity.fromJson(json),
            )
            .toList(),
      );
    } catch (error) {
      return GetCommentsByPostIdResult(
        error: AppError(
          message: CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }

  Future<SendCommentResult> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    try {
      await dio.post('/comments/');
      return SendCommentResult(success: true);
    } catch (error) {
      return SendCommentResult(
        error: AppError(
          message: CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }
}
