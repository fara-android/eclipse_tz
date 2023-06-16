import 'package:eclipse_tz/app/domain/use_cases/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/entities/user/user_entity.dart';

part 'get_all_users_cubit.freezed.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  final UserUseCase useCase;
  GetAllUsersCubit(this.useCase)
      : super(const GetAllUsersState.initial());

  Future<void> getUsers() async {
    emit(const GetAllUsersState.loading());
    final result = await useCase.getAllUsers();

    if (result.error == null) {
      emit(GetAllUsersState.success(result.users!));
    } else {
      emit(GetAllUsersState.failed(result.error!.message));
    }
  }
}

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.initial() = _Initial;
  const factory GetAllUsersState.loading() = _Loading;
  const factory GetAllUsersState.success(List<UserEntity> users) = _Success;
  const factory GetAllUsersState.failed(String error) = _Failed;
}
