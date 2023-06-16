import 'package:eclipse_tz/app/presentation/cubits/get_all_users/get_all_users_cubit.dart';
import 'package:eclipse_tz/app/presentation/screens/main/components/user_card.dart';
import 'package:eclipse_tz/data/models/user_model.dart';
import 'package:eclipse_tz/data/services/api_service.dart';
import 'package:eclipse_tz/app/presentation/theme/app_colors.dart';
import 'package:eclipse_tz/app/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../../widgets/loader.dart';
import '../user/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<UserModel> result = List.empty();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      result = await ApiService.getAllUsers();
      setState(() {
        _isLoading = false;
      });
    });
  }

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
      body: _isLoading
          ? const Loader()
          : BlocProvider(
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
