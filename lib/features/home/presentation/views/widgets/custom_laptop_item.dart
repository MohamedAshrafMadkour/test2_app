import 'package:flutter/material.dart';
import 'package:test2_app/core/widget/custom_cached_network_image.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/presentation/views/part_view/laptop_details.dart';

class CustomLaptopItem extends StatelessWidget {
  final LaptopsModel product;

  const CustomLaptopItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LaptopDetails(laptopModel: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
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
                      product.name ?? 'Unnamed Laptop',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Text(
                          "${product.price ?? 'N/A'} EGP",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "-${product.price!}%",
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
                        Expanded(
                          child: Text(
                            product.company ?? 'Unknown Brand',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13.5,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Text(
                      (product.countInStock ?? 0) > 0
                          ? "In Stock: ${product.countInStock}"
                          : "Out of Stock",
                      style: TextStyle(
                        color: (product.countInStock ?? 0) > 0
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
