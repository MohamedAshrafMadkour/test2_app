import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/auth/register/data/repo/register_repo.dart';
import 'package:test2_app/features/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:test2_app/features/auth/register/presentation/view/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(getIt.get<RegisterRepo>()),
        child: const RegisterViewBody(),
      ),
    );
  }
}
