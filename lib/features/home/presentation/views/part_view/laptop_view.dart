import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/presentation/manager/laptop/laptop_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_laptop_item.dart';

class LaptopView extends StatelessWidget {
  const LaptopView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LaptopCubit(getIt.get<LaptopRepo>())..getProductData(),
        ),
      ],
      child: ProductViewBody(),
    );
  }
}

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaptopCubit, LaptopState>(
      builder: (context, state) {
        if (state is LaptopSuccess) {
          return ListView.builder(
            itemCount: state.productsList.length,
            itemBuilder: (context, index) {
              return CustomLaptopItem(product: state.productsList[index]);
            },
          );
        } else if (state is LaptopFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
