import 'package:eclipse_tz/app/presentation/cubits/send_comment/send_comment_cubit.dart';
import 'package:eclipse_tz/app/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_text_field.dart';

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key});

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
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
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      scrollable: true,
      title: const Text('Add new comment'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: nameController,
                prefixIcon: const Icon(Icons.person),
                hintText: 'Name',
                validatorMessage: 'Name cannot be empty',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email),
                hintText: 'E-mail',
                validatorMessage: 'Email cannot be empty',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: commentController,
                prefixIcon: const Icon(Icons.message),
                hintText: 'Comment',
                validatorMessage: 'Comment cannot be empty',
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        BlocListener<SendCommentCubit, SendCommentState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                success: () {
                  Navigator.of(context).pop();
                  _clearText();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Success",
                        style: AppTextStyles.title,
                      ),
                    ),
                  );
                },
                failed: (message) {
                  Navigator.of(context).pop();
                  _clearText();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        message,
                        style: AppTextStyles.title,
                      ),
                    ),
                  );
                });
          },
          child: TextButton(
            child: const Text('Submit'),
            onPressed: () {
              BlocProvider.of<SendCommentCubit>(context).sendComment(
                name: nameController.text,
                email: emailController.text,
                body: commentController.text,
              );
            },
          ),
        )
      ],
    );
  }
}
