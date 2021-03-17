import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          150,
          (index) => CachedNetworkImage(
            imageUrl: "https://poptv.orange.es/wp-content/uploads/sites/3/2019/10/equipo.jpeg",
            placeholder: (_, __) => CircularProgressIndicator(),
          ),
        ).toList(),
      ),
    );
  }
}
