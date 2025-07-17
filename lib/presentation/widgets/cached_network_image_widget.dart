import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.contain,
        placeholder: (context, url) => Shimmer(
          duration: const Duration(seconds: 2),
          interval: const Duration(seconds: 1),
          color: Colors.white,
          colorOpacity: 0,
          enabled: true,
          direction: const ShimmerDirection.fromLTRB(),  //Default Value
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
