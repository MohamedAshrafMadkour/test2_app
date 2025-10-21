import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/function/custom_auth_app_bar.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/auth/login/data/login_repo/login_repo.dart';
import 'package:test2_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:test2_app/features/auth/login/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppBar(title: 'Login'),
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<LoginRepo>()),
        child: LoginViewBody(),
      ),
    );
  }
}
