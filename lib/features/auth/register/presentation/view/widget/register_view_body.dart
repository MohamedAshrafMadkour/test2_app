import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/constants/my_validator.dart';
import 'package:test2_app/core/widget/custom_button.dart';
import 'package:test2_app/core/widget/custom_password_field.dart';
import 'package:test2_app/core/widget/custom_text_form_field.dart';
import 'package:test2_app/features/auth/login/presentation/view/login_view.dart';
import 'package:test2_app/features/auth/register/data/model/register_model.dart';
import 'package:test2_app/features/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:test2_app/features/auth/register/presentation/view/widget/image_field.dart';
import 'package:test2_app/features/home/presentation/views/main_view.dart';
import 'package:test2_app/features/home/presentation/views/widgets/laptop_details_body.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? fileImage;
  Uint8List? imageBytes;
  String image = '';
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) =>
                        MyValidators.displayNameValidator(value),
                    hintText: 'name',
                    keyboardType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) => MyValidators.emailValidator(value),
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 30),
                  CustomPasswordField(
                    onSaved: (value) {},
                    controller: passwordController,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) => MyValidators.phoneValidator(value),
                    hintText: 'phone number',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) =>
                        MyValidators.nationalIdValidator(value),
                    hintText: 'national id',
                    keyboardType: TextInputType.number,
                    controller: nationalIdController,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) =>
                        MyValidators.genderValidator(value: value),
                    hintText: 'gender',
                    keyboardType: TextInputType.text,
                    controller: genderController,
                  ),
                  const SizedBox(height: 30),
                  ImageField(
                    onImageSelected: (file) {
                      fileImage = file;
                      imageBytes = fileImage!.readAsBytesSync();
                      image = base64Encode(imageBytes!);
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginView()),
                        );
                      } else if (state is RegisterFailure) {
                        showAwesomeSnackBar(
                          context: context,
                          message: state.errorMessage,
                          backgroundColor: Colors.redAccent.shade700,
                          icon: Icons.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isCenter: true,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            final RegisterModel registerModel = RegisterModel(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phone: phoneController.text.trim(),
                              nationalId: nationalIdController.text.trim(),
                              gender: genderController.text.trim(),
                              image: image,
                              password: passwordController.text.trim(),
                            );
                            BlocProvider.of<RegisterCubit>(
                              context,
                            ).register(userModel: registerModel);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        color: Colors.green,
                        title: 'Sign Up',
                        icon: Icons.login,
                        isLoading: state is RegisterLoading,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
