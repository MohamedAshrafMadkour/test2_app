import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test2_app/core/widget/custom_cached_network_image.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, required this.laptop});

  final LaptopsModel laptop;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * 0.35,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayCurve: Curves.easeInOut,
      ),
      items: laptop.images?.map((imageUrl) {
        return Builder(
          builder: (context) => SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: CustomCachedNetworkImage(
              image: imageUrl,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      }).toList(),
    );
  }
}
