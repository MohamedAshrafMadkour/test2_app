import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/presentation/manager/delete_fav/delete_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/display_fav_cubit/display_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_fav_item.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DisplayFavCubit(getIt.get<LaptopRepo>())..getFav(),
        ),
        BlocProvider(
          create: (context) => DeleteFavCubit(getIt.get<LaptopRepo>()),
        ),
      ],
      child: FavBody(),
    );
  }
}

class FavBody extends StatelessWidget {
  const FavBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayFavCubit, DisplayFavState>(
      builder: (context, state) {
        if (state is DisplayFavSuccess) {
          return ListView.builder(
            itemCount: state.productsList.length,
            itemBuilder: (context, index) {
              return CustomFavItem(product: state.productsList[index]);
            },
          );
        } else if (state is DisplayFavFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
