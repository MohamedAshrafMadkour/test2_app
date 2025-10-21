import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/function/custom_app_bar.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/presentation/manager/add_fav/add_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/post_cart_cubit/cart_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/laptop_details_body.dart';

class LaptopDetails extends StatelessWidget {
  const LaptopDetails({required this.laptopModel, super.key});
  final LaptopsModel laptopModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddFavCubit(getIt.get<LaptopRepo>())),
        BlocProvider(create: (context) => CartCubit(getIt.get<LaptopRepo>())),
      ],
      child: Scaffold(
        appBar: customAppBar(context, laptopModel),
        body: LaptopDetailsBody(laptop: laptopModel),
      ),
    );
  }
}
