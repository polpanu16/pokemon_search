import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemonsearchapp/core/util/utils.dart';

class CustomWidget {
  static Widget cachedCircleAvatar({double radius = 32, String imageUrl = ""}) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 2 * radius,
        height: 2 * radius,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => CircleAvatar(
            backgroundColor: Colors.white,
            radius: radius,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                ),
                Text("Image Error")
              ],
            )),
      ),
    );
  }

  static Widget pokemonsTypeImage(List<String> types) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var type in types)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage(Utils.getImageByTypes(type)),
            ),
          ),
      ],
    );
  }
}
