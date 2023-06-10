import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myflix/src/features/domain.dart';

class VideoPlayerSection extends StatelessWidget {
  const VideoPlayerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: CachedNetworkImage(
        imageUrl: dummyImageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
