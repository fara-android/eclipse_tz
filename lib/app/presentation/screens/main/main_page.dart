import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../cubits/get_all_users/get_all_users_cubit.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/loader.dart';
import '../user/user_page.dart';
import 'components/user_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocProvider(
        create: (context) => sl<GetAllUsersCubit>()..getUsers(),
        child: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Loader(),
              success: (users) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: users.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return UserCard(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              userModel: users[index],
                            ),
                          ),
                        );
                      },
                      userName: users[index].username,
                      name: users[index].name,
                    );
                  },
                );
              },
              failed: (message) => Text(message),
            );
          },
        ),
      ),
    );
  }
}
