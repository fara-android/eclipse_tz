import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eclipse_tz/app/data/entities/album_with_photos/album_with_photos_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/use_cases/album_use_case.dart';

part 'get_albums_with_photos_cubit.freezed.dart';

class GetAlbumsWithPhotosCubit extends Cubit<GetAlbumsWithPhotosState> {
  final AlbumUseCase useCase;
  GetAlbumsWithPhotosCubit(this.useCase)
      : super(const GetAlbumsWithPhotosState.initial());

  Future<void> getAlbumsWithPhotosByUserIdResult(int userId) async {
    emit(const GetAlbumsWithPhotosState.loading());
    final result = await useCase.getAlbumsWithPhotosByUserIdResult(userId);

    if (result.error == null) {
      emit(GetAlbumsWithPhotosState.success(result.albums!));
    } else {
      emit(GetAlbumsWithPhotosState.failed(result.error!.message));
    }
  }
}

@freezed
class GetAlbumsWithPhotosState with _$GetAlbumsWithPhotosState {
  const factory GetAlbumsWithPhotosState.initial() = _Initial;
  const factory GetAlbumsWithPhotosState.loading() = _Loading;
  const factory GetAlbumsWithPhotosState.success(
      List<AlbumWithPhotosEntity> albums) = _Success;
  const factory GetAlbumsWithPhotosState.failed(String error) = _Failed;
}
