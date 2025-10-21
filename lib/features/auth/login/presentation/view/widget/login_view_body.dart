import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/constants/my_validator.dart';
import 'package:test2_app/core/function/custom_snack_bar.dart';
import 'package:test2_app/core/widget/custom_button.dart';
import 'package:test2_app/core/widget/custom_password_field.dart';
import 'package:test2_app/core/widget/custom_text_form_field.dart';
import 'package:test2_app/features/auth/login/data/model/user_model.dart';
import 'package:test2_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:test2_app/features/home/presentation/views/main_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: CustomScrollView(
          anchor: .07,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 4),
                  CustomTextFormField(
                    validator: (value) => MyValidators.emailValidator(value),
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 4),
                  CustomPasswordField(controller: passwordController),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          final message = state.message['message'];
                          customSnackBar(
                            context,
                            message == 'User logged in successfully'
                                ? 'User logged in successfully'
                                : state.message['message'],
                            isError: message != 'User logged in successfully'
                                ? true
                                : false,
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainView()),
                            (_) => false,
                          );
                        } else if (state is LoginFailure) {
                          customSnackBar(
                            context,
                            state.errorMessage,
                            isError: true,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: state is LoginLoading,
                          color: Colors.green,
                          title: 'Sign In',
                          isCenter: true,
                          icon: Icons.login_outlined,
                          onPressed: () {
                            final UserModel userModel = UserModel(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            context.read<LoginCubit>().login(
                              userModel: userModel,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
