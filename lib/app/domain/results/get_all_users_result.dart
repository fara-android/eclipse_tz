import 'package:eclipse_tz/app/data/entities/user/user_entity.dart';

import '../../data/helpers/app_error.dart';

class GetAllUsersResult {
  GetAllUsersResult({
    this.error,
    this.users,
  });

  final AppError? error;
  final List<UserEntity>? users;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $users)';
}