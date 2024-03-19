//*The provided code does not use any external state management libraries.(Riverpod, getX ,bloC etc.)
//* It relies on Flutter's built-in StatefulWidget and setState method for managing the state within the widget.
import 'package:flutter/material.dart';

class ImageBuilderAnimation extends StatelessWidget {
  final String imageAssetPath;
  final double RADIUS;

  ImageBuilderAnimation(
      {Key? key, required this.imageAssetPath, required this.RADIUS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.5, end: 0.91),
      duration: Duration(milliseconds: 1500),
      builder: (BuildContext context, double _scale, Widget? child) {
        return Transform.scale(
            scale: _scale,
            child: CircleAvatar(
                backgroundImage: AssetImage(imageAssetPath),
                radius: _scale * RADIUS));
      },
    );
  }
}
