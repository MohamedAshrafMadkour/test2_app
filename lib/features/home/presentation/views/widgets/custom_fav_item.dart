import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/widget/custom_cached_network_image.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/presentation/manager/delete_fav/delete_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/display_fav_cubit/display_fav_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/laptop_details_body.dart';

class CustomFavItem extends StatelessWidget {
  final LaptopsModel product;

  const CustomFavItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.12,
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: CustomCachedNetworkImage(image: product.image ?? ''),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? 'No title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "${product.price ?? 'N/A'} EGP",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6),

                          Text(
                            '-${product.price}%',
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.business_rounded,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            product.company ?? 'Unknown Brand',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Text(
                        'In Stock: ${product.countInStock ?? 0}',
                        style: TextStyle(
                          color: (product.countInStock ?? 0) > 0
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocConsumer<DeleteFavCubit, DeleteFavState>(
                listener: (context, state) {
                  if (state is DeleteFavSuccess) {
                    showAwesomeSnackBar(
                      context: context,
                      message: state.message,
                      backgroundColor: Colors.greenAccent.shade700,
                      icon: Icons.check_circle,
                    );
                    BlocProvider.of<DisplayFavCubit>(context).getFav();
                  } else if (state is DeleteFavFailure) {
                    showAwesomeSnackBar(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: Colors.red.shade700,
                      icon: Icons.error,
                    );
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      final IdModel idModel = IdModel(
                        productId: product.id!,
                        quantity: product.countInStock.toString(),
                      );
                      BlocProvider.of<DeleteFavCubit>(
                        context,
                      ).deleteFav(idModel: idModel);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.redAccent.shade700,
                      size: 25,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
