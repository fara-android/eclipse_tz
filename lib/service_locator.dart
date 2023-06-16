import 'package:eclipse_tz/app/domain/repositories/albums_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/comment_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/post_repository.dart';
import 'package:eclipse_tz/app/domain/repositories/user_repository.dart';
import 'package:eclipse_tz/app/domain/use_cases/album_use_case.dart';
import 'package:eclipse_tz/app/domain/use_cases/comment_use_case.dart';
import 'package:eclipse_tz/app/domain/use_cases/post_use_case.dart';
import 'package:eclipse_tz/app/domain/use_cases/user_use_case.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_albums_with_photos/get_albums_with_photos_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_all_users/get_all_users_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_comments/get_comments_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_posts/get_posts_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/send_comment/send_comment_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/repositories/album/album_repo_impl.dart';
import 'app/data/repositories/api_repository.dart';
import 'app/data/repositories/comment/comment_repo_impl.dart';
import 'app/data/repositories/post/post_repo_impl.dart';
import 'app/data/repositories/user/user_repo_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  // Repository
  sl.registerLazySingleton<ApiRepository>(
    () => ApiRepository(),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepoImpl(repository: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepoImpl(repository: sl()),
  );
  sl.registerLazySingleton<AlbumsRepository>(
    () => AlbumRepoImpl(repository: sl()),
  );
  sl.registerLazySingleton<CommentRepository>(
    () => CommentRepoImpl(repository: sl()),
  );

  // // UseCases
  sl.registerLazySingleton<UserUseCase>(
    () => UserUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<PostUseCase>(
    () => PostUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<CommentUseCase>(
    () => CommentUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<AlbumUseCase>(
    () => AlbumUseCase(
      repository: sl(),
    ),
  );

  // // Bloc / Cubit
  sl.registerFactory(
    () => GetAllUsersCubit(sl()),
  );
  sl.registerFactory(
    () => GetPostsCubit(sl()),
  );
  sl.registerFactory(
    () => GetAlbumsWithPhotosCubit(sl()),
  );
  sl.registerFactory(
    () => GetCommentsCubit(sl()),
  );
  sl.registerFactory(
    () => SendCommentCubit(sl()),
  );
}
