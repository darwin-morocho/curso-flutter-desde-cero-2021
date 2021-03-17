import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://poptv.orange.es/wp-content/uploads/sites/3/2019/10/equipo.jpeg",
      placeholder: (_, __) => Center(
        child: CircularProgressIndicator(),
      ),
      fit: BoxFit.cover,
    );
  }
}
