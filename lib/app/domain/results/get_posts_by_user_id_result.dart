import 'package:eclipse_tz/app/data/entities/post/post_entity.dart';

import '../../data/helpers/app_error.dart';

class GetPostsByUserIdResult {
  GetPostsByUserIdResult({
    this.error,
    this.posts,
  });

  final AppError? error;
  final List<PostEntity>? posts;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $posts)';
}