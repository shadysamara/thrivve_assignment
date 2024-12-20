import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';

//refactored
class NetworkImageWithLoader extends StatelessWidget {
  final String? src;
  final BoxFit fit;
  final double radius;
  final Color? color;

  const NetworkImageWithLoader(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: _buildImage(context),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (src == null || src!.isEmpty) {
      return _buildPlaceholder();
    } else {
      return CachedNetworkImage(
        fit: fit,
        imageUrl: src!,
        color: color,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => _buildPlaceholder(),
      );
    }
  }

  Widget _buildPlaceholder() {
    return Image.asset(
      ImgAssets.logo,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(radius),
            image: const DecorationImage(
              image: AssetImage(ImgAssets.logo),
            ),
          ),
        );
      },
    );
  }
}
