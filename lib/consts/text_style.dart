import 'package:flutter/material.dart';
import 'package:kanpekimusic/consts/colors.dart';

ourStyle({family = "regular", double? size = 15, color = whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family
  );
}