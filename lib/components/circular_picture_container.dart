import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class CircularPictureContainer extends StatelessWidget {
  final double size;
  final ImageProvider image;

  const CircularPictureContainer({
    this.size,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.accentColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
          ),
        ],
        shape: BoxShape.circle,
        image: DecorationImage(image: image),
      ),
    );
  }
}
