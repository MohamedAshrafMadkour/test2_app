import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.image,
    super.key,
    this.borderRadius,
  });
  final BorderRadius? borderRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 1.9,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          placeholder: (context, url) => Skeletonizer(
            child: Container(width: 100, height: 100, color: Colors.white),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
