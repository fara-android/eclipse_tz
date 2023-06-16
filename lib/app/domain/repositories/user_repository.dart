import 'package:eclipse_tz/app/domain/results/get_all_users_result.dart';

abstract class UserRepository {
  Future<GetAllUsersResult> getEvents();
}


