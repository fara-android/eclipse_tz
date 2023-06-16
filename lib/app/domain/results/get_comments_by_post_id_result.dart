import 'package:eclipse_tz/app/data/entities/comment/comment_entity.dart';
import '../../data/helpers/app_error.dart';

class GetCommentsByPostIdResult {
  GetCommentsByPostIdResult({
    this.error,
    this.comments,
  });

  final AppError? error;
  final List<CommentEntity>? comments;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $comments)';
}