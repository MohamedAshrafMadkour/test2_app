import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/widget/custom_button.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/presentation/manager/get_cart/get_cart_cubit.dart';
import 'package:test2_app/features/home/presentation/manager/update_cart/update_cart_cubit.dart';
import 'package:test2_app/features/home/presentation/views/widgets/laptop_details_body.dart';

class CustomUpdateItemCount extends StatefulWidget {
  const CustomUpdateItemCount({required this.cartItem, super.key});

  final CartModel cartItem;

  @override
  State<CustomUpdateItemCount> createState() => _CustomUpdateItemCountState();
}

class _CustomUpdateItemCountState extends State<CustomUpdateItemCount> {
  late int count;
  @override
  void initState() {
    count = widget.cartItem.quantity ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocConsumer<UpdateCartCubit, UpdateCartState>(
              listener: (context, state) {
                if (state is UpdateCartSuccess) {
                  showAwesomeSnackBar(
                    context: context,
                    message: 'Updated Successfully',
                    backgroundColor: Colors.greenAccent.shade700,
                    icon: Icons.check_circle,
                  );
                  BlocProvider.of<GetCartCubit>(context).getCart();
                }
                if (state is UpdateCartFailure) {
                  showAwesomeSnackBar(
                    context: context,
                    message: state.errorMessage,
                    backgroundColor: Colors.red.shade700,
                    icon: Icons.error,
                  );
                }
              },
              builder: (context, state) => CustomButton(
                title: 'Update',
                icon: Icons.update,
                isLoading: false,
                onPressed: () {
                  final IdModel idModel = IdModel(
                    quantity: count.toString(),
                    productId: widget.cartItem.id.toString(),
                  );
                  BlocProvider.of<UpdateCartCubit>(
                    context,
                  ).updateCart(idModel: idModel);
                },
                color: Colors.green.shade700,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade700,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
            SizedBox(width: 8),
            Text('$count'),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade700,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (count > 1) count--;
                  });
                },
                child: Icon(Icons.remove, color: Colors.white),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
