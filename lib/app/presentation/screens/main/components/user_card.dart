import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class UserCard extends StatelessWidget {
  final Function() onTap;
  final String userName;
  final String name;
  const UserCard(
      {super.key,
      required this.onTap,
      required this.userName,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.gray,
        padding: const EdgeInsets.all(10),
        child: ListTile(
          horizontalTitleGap: 8,
          title: Text(
            userName,
            style: AppTextStyles.title,
          ),
          subtitle: Text(
            name,
            style: AppTextStyles.subtitle,
          ),
          leading: const Icon(
            Icons.person,
            size: 32,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
