import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<LaptopRepo>())..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            log(state.profileModel.toString());
            return ProfileViewBody(
              profile: state.profileModel,
            );
          } else if (state is ProfileFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
