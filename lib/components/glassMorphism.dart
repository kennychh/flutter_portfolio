import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    required this.constraints,
    required this.child,
    required this.blur,
    this.padding = EdgeInsets.zero,
    this.color = Colors.white,
    this.height = 0,
    this.opacity = 0.2,
    Key? key,
  }) : super(key: key);
  final BoxConstraints constraints;
  final double height;
  final double blur;
  final double opacity;
  final EdgeInsets padding;
  final Widget child;
  final color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Container(
      height: height,
      constraints: constraints,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(color: color.withOpacity(opacity)),
          child: child,
        ),
      ),
    ));
  }
}
