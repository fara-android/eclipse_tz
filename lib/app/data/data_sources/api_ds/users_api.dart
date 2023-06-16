import 'package:dio/dio.dart';
import 'package:eclipse_tz/app/data/entities/user/user_entity.dart';
import 'package:eclipse_tz/app/domain/results/get_all_users_result.dart';
import '../../helpers/app_error.dart';
import '../../helpers/catch_exception.dart';

class UsersApi {
  final Dio dio;
  UsersApi({required this.dio});

  Future<GetAllUsersResult> getAllUsers() async {
    try {
      final response = await dio.get('/users/');
      return GetAllUsersResult(
        users: response.data
            .map<UserEntity>(
              (json) => UserEntity.fromJson(json),
            )
            .toList(),
      );
    } catch (error) {
      return GetAllUsersResult(
        error: AppError(
          message: CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }
}
