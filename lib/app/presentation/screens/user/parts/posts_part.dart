part of '../user_page.dart';

class PostsPart extends StatelessWidget {
  final UserEntity userEntity;
  const PostsPart({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsCubit, GetPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Loader(),
          success: (posts) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'User Posts',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllPostsPage(
                              user: userEntity,
                              posts: posts,
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
                            builder: (context) => PostDetailPage(
                              post: posts[index],
                            ),
                          ),
                        );
                      },
                      child: PostCard(
                        post: posts[index],
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
