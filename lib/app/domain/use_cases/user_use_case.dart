import 'package:eclipse_tz/app/domain/repositories/user_repository.dart';
import 'package:eclipse_tz/app/domain/results/get_all_users_result.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase({
    required this.repository,
  });

  Future<GetAllUsersResult> getAllUsers() async {
    final result = await repository.getUsers();

    return result;
  }
}
