import 'dart:math';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: url,
      shimmerBaseColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      shimmerHighlightColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      shimmerBackColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      errorWidget: const Icon(Icons.error),
    );
  }
}
