import '../../data/helpers/app_error.dart';

class SendCommentResult {
  SendCommentResult({
    this.error,
    this.success,
  });

  final AppError? error;
  final bool? success;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $success)';
}
