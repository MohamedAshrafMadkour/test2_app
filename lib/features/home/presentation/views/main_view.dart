import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/features/home/presentation/manager/nav_bar/nav_bar_cubit.dart';
import 'package:test2_app/features/home/presentation/views/part_view/cart_view.dart';
import 'package:test2_app/features/home/presentation/views/part_view/fav_view.dart';
import 'package:test2_app/features/home/presentation/views/part_view/laptop_view.dart';
import 'package:test2_app/features/home/presentation/views/part_view/profile_view.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: MainScaffold(),
    );
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NavBarCubit>(context);
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomBar(
            onTabChange: (index) => cubit.change(index: index),
          ),
          body: views[cubit.currentIndex],
        );
      },
    );
  }
}

List<Widget> views = [
  const LaptopView(),
  const FavView(),
  const CartView(),
  const ProfileView(),
];
