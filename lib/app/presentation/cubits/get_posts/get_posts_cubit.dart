import 'package:eclipse_tz/app/data/entities/post/post_entity.dart';
import 'package:eclipse_tz/app/domain/use_cases/post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_posts_cubit.freezed.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  final PostUseCase useCase;
  GetPostsCubit(this.useCase) : super(const GetPostsState.initial());

  Future<void> getPostsByUserId(int userId) async {
    emit(const GetPostsState.loading());
    final result = await useCase.getPostsByUserId(userId);

    if (result.error == null) {
      emit(GetPostsState.success(result.posts!));
    } else {
      emit(GetPostsState.failed(result.error!.message));
    }
  }
}

@freezed
class GetPostsState with _$GetPostsState {
  const factory GetPostsState.initial() = _Initial;
  const factory GetPostsState.loading() = _Loading;
  const factory GetPostsState.success(List<PostEntity> posts) = _Success;
  const factory GetPostsState.failed(String error) = _Failed;
}
