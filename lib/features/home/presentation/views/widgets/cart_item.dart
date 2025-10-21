import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/widget/custom_cached_network_image.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/presentation/manager/delete_cart/deletecart_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/get_cart/get_cart_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_cart_item_second_section.dart';
import 'package:test2_app/features/home/presentation/views/widgets/custom_update_item_count.dart';
import 'package:test2_app/features/home/presentation/views/widgets/laptop_details_body.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;

  const CartItemWidget({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CustomCachedNetworkImage(image: cartItem.image ?? ''),
                ),
                const SizedBox(width: 12),
                CustomCartItemSecondSection(cartItem: cartItem),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Quantity',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cartItem.quantity}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      BlocConsumer<DeleteCartCubit, DeleteCartState>(
                        listener: (context, state) {
                          if (state is DeleteCartSuccess) {
                            showAwesomeSnackBar(
                              context: context,
                              message: 'Deleted Successfully',
                              backgroundColor: Colors.greenAccent.shade700,
                              icon: Icons.check_circle,
                            );
                            BlocProvider.of<GetCartCubit>(context).getCart();
                          }
                        },
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              final IdModel idModel = IdModel(
                                quantity: cartItem.quantity.toString(),
                                productId: cartItem.id.toString(),
                              );
                              BlocProvider.of<DeleteCartCubit>(
                                context,
                              ).deleteCart(idModel: idModel);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            CustomUpdateItemCount(cartItem: cartItem),
          ],
        ),
      ),
    );
  }
}
