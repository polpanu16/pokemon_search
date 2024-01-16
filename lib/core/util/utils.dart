import 'package:flutter/material.dart';

class Utils {
  static String getImageByTypes(String type) {
    Map<String, String> typeImagePaths = {
      "normal": "normal-type.png",
      "fighting": "fighting-type.png",
      "flying": "flying-type.png",
      "poison": "poison-type.png",
      "ground": "ground-type.png",
      "rock": "rock-type.png",
      "bug": "bug-type.png",
      "ghost": "ghost-type.png",
      "steel": "steel-type.png",
      "fire": "fire-type.png",
      "water": "water-type.png",
      "grass": "grass-type.png",
      "electric": "electric-type.png",
      "psychic": "psychic-type.png",
      "ice": "ice-type.png",
      "dragon": "dragon-type.png",
      "dark": "shadow-type.png",
      "fairy": "fairy-type.png",
      "unknown": "normal-type.png",
      "shadow": "shadow-type.png",
    };

    if (typeImagePaths.containsKey(type)) {
      return "assets/icons/${typeImagePaths[type]}";
    } else {
      return "assets/icons/normal-type.png";
    }
  }

  static Color getMainColorByType(String type) {
    Map<String, Color> typeColors = {
      "normal": Colors.grey,
      "fighting": Colors.red,
      "flying": Colors.blue,
      "poison": Colors.purple,
      "ground": Colors.orange,
      "rock": Colors.brown,
      "bug": Colors.green,
      "ghost": Colors.purple,
      "steel": Colors.grey,
      "fire": Colors.red,
      "water": Colors.blue,
      "grass": Colors.green,
      "electric": Colors.amber,
      "psychic": Colors.pink,
      "ice": Colors.lightBlue,
      "dragon": Colors.indigo,
      "dark": Colors.black,
      "fairy": Colors.pink,
      "unknown": Colors.grey,
      "shadow": Colors.black,
    };

    if (typeColors.containsKey(type)) {
      return typeColors[type]!;
    } else {
      return Colors.grey;
    }
  }
}
