import 'package:eclipse_tz/app/domain/use_cases/comment_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_comment_cubit.freezed.dart';

class SendCommentCubit extends Cubit<SendCommentState> {
  final CommentUseCase useCase;
  SendCommentCubit(this.useCase) : super(const SendCommentState.initial());

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    emit(const SendCommentState.loading());
    final result = await useCase.sendComment(
      body: body,
      email: email,
      name: name,
    );

    if (result.error == null) {
      emit(const SendCommentState.success());
    } else {
      emit(SendCommentState.failed(result.error!.message));
    }
  }
}

@freezed
class SendCommentState with _$SendCommentState {
  const factory SendCommentState.initial() = _Initial;
  const factory SendCommentState.loading() = _Loading;
  const factory SendCommentState.success() = _Success;
  const factory SendCommentState.failed(String error) = _Failed;
}
