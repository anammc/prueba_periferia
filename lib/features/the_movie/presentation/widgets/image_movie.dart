import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageMovie extends StatelessWidget {
  final String imageUrl;
  const ImageMovie({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      imageUrl: 'https://media.themoviedb.org/t/p/w600_and_h900_bestv2${imageUrl}',
      errorWidget: (context, url, error) => Image.asset('assets/images/no_image.jpg'),
    );
  }
}