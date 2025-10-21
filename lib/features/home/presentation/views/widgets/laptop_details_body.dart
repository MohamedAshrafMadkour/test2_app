import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test2_app/core/widget/custom_button.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/presentation/manager/add_fav/add_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/post_cart_cubit/cart_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_carousel_slider.dart';

class LaptopDetailsBody extends StatelessWidget {
  const LaptopDetailsBody({required this.laptop, super.key});

  final LaptopsModel laptop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarouselSlider(laptop: laptop),
          const SizedBox(height: 24),
          Text(
            laptop.name ?? 'Unknown Laptop',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(FontAwesomeIcons.laptop, size: 18, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                laptop.company ?? 'Unknown Company',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '\$${laptop.price?.toStringAsFixed(2) ?? 'N/A'}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            laptop.description ?? 'No description available.',
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.store, size: 24, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                laptop.countInStock != null && laptop.countInStock! > 0
                    ? 'Available in stock (${laptop.countInStock})'
                    : 'Out of stock',
                style: TextStyle(
                  fontSize: 15,
                  color: laptop.countInStock != null && laptop.countInStock! > 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButtonBloc(laptop: laptop),
          const SizedBox(height: 16),
          CustomButtonCartBloc(laptop: laptop),
        ],
      ),
    );
  }
}

class CustomButtonBloc extends StatelessWidget {
  const CustomButtonBloc({required this.laptop, super.key});
  final LaptopsModel laptop;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFavCubit, AddFavState>(
      listener: (context, state) {
        if (state is AddFavAdd) {
          showAwesomeSnackBar(
            context: context,
            message: state.message,
            backgroundColor: Colors.greenAccent.shade700,
            icon: Icons.check_circle,
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: CustomButton(
            isLoading: state is AddFavLoading,
            color: Colors.green,
            title: 'Add To Favorite',
            isCenter: true,
            icon: FontAwesomeIcons.heart,
            onPressed: () {
              BlocProvider.of<AddFavCubit>(context).addFav(id: laptop.id ?? '');
            },
          ),
        );
      },
    );
  }
}

class CustomButtonCartBloc extends StatelessWidget {
  const CustomButtonCartBloc({required this.laptop, super.key});
  final LaptopsModel laptop;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartSuccess) {
            showAwesomeSnackBar(
              context: context,
              message: 'Added to cart',
              backgroundColor: Colors.greenAccent.shade700,
              icon: Icons.check_circle,
            );
          } else if (state is CartFailure) {
            showAwesomeSnackBar(
              context: context,
              message: state.errorMessage,
              backgroundColor: Colors.red.shade700,
              icon: Icons.error,
            );
          }
        },
        builder: (context, state) {
          return CustomButton(
            isCenter: true,
            isLoading: state is CartLoading,
            color: Colors.green,
            title: 'Add To Cart',
            icon: FontAwesomeIcons.heart,
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addToCart(
                idModel: IdModel(
                  productId: laptop.id ?? '',
                  quantity: '1',
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void showAwesomeSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  IconData? icon,
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.greenAccent.shade700,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (backgroundColor ?? Colors.greenAccent.shade700)
                  .withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon ?? Icons.check_circle, color: Colors.white, size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
