import 'package:bloc/bloc.dart';
import 'package:eclipse_tz/app/data/entities/comment/comment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/use_cases/comment_use_case.dart';

part 'get_comments_cubit.freezed.dart';

class GetCommentsCubit extends Cubit<GetCommentsState> {
  final CommentUseCase useCase;
  GetCommentsCubit(this.useCase) : super(const GetCommentsState.initial());

  Future<void> getCommentsByPostId(int postId) async {
    emit(const GetCommentsState.loading());
    final result = await useCase.getCommentsByPostId(postId);

    if (result.error == null) {
      emit(GetCommentsState.success(result.comments!));
    } else {
      emit(GetCommentsState.failed(result.error!.message));
    }
  }
}

@freezed
class GetCommentsState with _$GetCommentsState {
  const factory GetCommentsState.initial() = _Initial;
  const factory GetCommentsState.loading() = _Loading;
  const factory GetCommentsState.success(List<CommentEntity> comments) =
      _Success;
  const factory GetCommentsState.failed(String error) = _Failed;
}
