//*The provided code does not use any external state management libraries.(Riverpod, getX ,bloC etc.)
//* It relies on Flutter's built-in StatefulWidget and setState method for managing the state within the widget.
import 'package:flutter/material.dart';

class ImageBuilderAnimation extends StatefulWidget {
  final String imageAssetPath;
  final double RADIUS;

  ImageBuilderAnimation(
      {Key? key, required this.imageAssetPath, required this.RADIUS})
      : super(key: key);

  @override
  State<ImageBuilderAnimation> createState() => _ImageBuilderAnimationState();
}

class _ImageBuilderAnimationState extends State<ImageBuilderAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.5, end: 0.91),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double _scale, Widget? child) {
        return Transform.scale(
            scale: _scale,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(widget.imageAssetPath),
                radius: _scale * widget.RADIUS));
      },
    );
  }
}
