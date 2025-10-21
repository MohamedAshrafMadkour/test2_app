import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/presentation/manager/delete_cart/deletecart_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/get_cart/get_cart_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/update_cart/update_cart_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/cart_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCartCubit(getIt.get<LaptopRepo>())..getCart(),
        ),
        BlocProvider(
          create: (context) => DeleteCartCubit(getIt.get<LaptopRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateCartCubit(getIt.get<LaptopRepo>()),
        ),
      ],
      child: const CartViewBody(),
    );
  }
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartSuccess) {
          log(state.cartList.toString());
          return ListView.builder(
            itemCount: state.cartList.length,
            itemBuilder: (context, index) {
              return CartItemWidget(cartItem: state.cartList[index]);
            },
          );
        } else if (state is GetCartFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
