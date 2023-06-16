import 'package:eclipse_tz/app/data/entities/post/post_entity.dart';
import 'package:eclipse_tz/app/presentation/cubits/get_comments/get_comments_cubit.dart';
import 'package:eclipse_tz/app/presentation/cubits/send_comment/send_comment_cubit.dart';
import 'package:eclipse_tz/app/presentation/screens/post/components/comment_dialog.dart';
import 'package:eclipse_tz/app/presentation/theme/app_colors.dart';
import 'package:eclipse_tz/app/presentation/theme/app_text_styles.dart';
import 'package:eclipse_tz/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/comment_card.dart';
import '../../widgets/loader.dart';

class PostDetailPage extends StatefulWidget {
  final PostEntity post;

  const PostDetailPage({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.post.title,
            style: AppTextStyles.title.copyWith(
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 7),
          Text(
            widget.post.body,
            style: AppTextStyles.bodyTextStyle.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Comments:'),
          const SizedBox(height: 8),
          BlocProvider(
            create: (context) =>
                sl<GetCommentsCubit>()..getCommentsByPostId(widget.post.id),
            child: BlocBuilder<GetCommentsCubit, GetCommentsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Loader(),
                  success: (comments) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return CommentCard(
                          username: comment.name,
                          comment: comment.body,
                          email: comment.email,
                        );
                      },
                      itemCount: comments.length,
                    );
                  },
                  failed: (message) => Text(message),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => sl<SendCommentCubit>(),
              child: const CommentDialog(),
            );
          },
        ),
      ),
    );
  }
}
