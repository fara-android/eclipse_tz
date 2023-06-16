part of '../user_page.dart';

class AlbumPart extends StatelessWidget {
  final UserEntity userEntity;
  const AlbumPart({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAlbumsWithPhotosCubit, GetAlbumsWithPhotosState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Loader(),
          success: (albums) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'User Albums',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllAlbumsPage(
                              user: userEntity,
                              albums: albums,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetailPage(
                              album: albums[index],
                            ),
                          ),
                        );
                      },
                      child: AlbumCard(
                        album: albums[index],
                      ),
                    );
                  },
                ),
              ],
            );
          },
          failed: (message) => Text(message),
        );
      },
    );
  }
}
