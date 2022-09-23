import 'package:flutter/material.dart';

class LikedIcon extends StatelessWidget {
  const LikedIcon({Key? key, this.liked}) : super(key: key);

  final bool? liked;

  @override
  Widget build(BuildContext context) {
    return liked ?? false
        ? const Icon(Icons.favorite, color: Colors.red)
        : const Icon(Icons.favorite_border, color: Colors.red);
  }
}
