import 'package:eclipse_tz/app/data/entities/user/user_entity.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_albums_with_photos/get_albums_with_photos_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_posts/get_posts_cubit.dart';
import 'package:eclipse_tz/app/presentation/screens/user/components/user_info.dart';
import 'package:eclipse_tz/app/presentation/screens/album/components/album_card.dart';
import 'package:eclipse_tz/app/presentation/screens/post/components/post_card.dart';
import 'package:eclipse_tz/app/presentation/theme/app_colors.dart';
import 'package:eclipse_tz/app/presentation/theme/app_text_styles.dart';
import 'package:eclipse_tz/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/loader.dart';
import '../album/album_detail_page.dart';
import '../album/all_albums_page.dart';
import '../post/all_posts_page.dart';
import '../post/post_detail_page.dart';
part 'parts/posts_part.dart';
part 'parts/albums_part.dart';

class UserPage extends StatelessWidget {
  final UserEntity userEntity;
  const UserPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(userEntity.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoWidget(
              name: userEntity.name,
              email: userEntity.email,
              phone: userEntity.phone,
              website: userEntity.website,
              companyName: userEntity.company.name,
              companyBs: userEntity.company.bs,
              companyCatchPhrase: userEntity.company.catchPhrase,
              city: userEntity.address.city,
              street: userEntity.address.street,
            ),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) =>
                  sl<GetPostsCubit>()..getPostsByUserId(userEntity.id),
              child: PostsPart(
                userEntity: userEntity,
              ),
            ),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) => sl<GetAlbumsWithPhotosCubit>()
                ..getAlbumsWithPhotosByUserIdResult(userEntity.id),
              child: AlbumPart(
                userEntity: userEntity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
