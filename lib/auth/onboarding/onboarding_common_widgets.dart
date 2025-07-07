import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageShade(String imageName) {
  return Center(
    child: ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.transparent],
      ).createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: Image.asset("assets/images/$imageName", fit: BoxFit.contain),
    ),
  );
}
