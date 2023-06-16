import 'package:eclipse_tz/app/data/repositories/api_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/user_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_all_users_result.dart';

import '../../helpers/app_error.dart';

class UserRepoImpl implements UserRepository {
  final ApiRepository repository;

  UserRepoImpl({required this.repository});

  @override
  Future<GetAllUsersResult> getUsers() async {
    final result = await repository.usersApi.getAllUsers();

    if (result.error == null) {
      return GetAllUsersResult(users: result.users!);
    } else {
      return GetAllUsersResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }
}
