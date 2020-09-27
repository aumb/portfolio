import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/circular_picture_container.dart';
import 'package:portfolio/core/core.dart';

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return BSColumn(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      height: size,
      children: [
        SizedBox(height: 56),
        Text(
          "Front-end Developer",
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          "I design and code beautifully simple things, and I love what I do.",
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 56),
        CircularPictureContainer(
          size: 150,
          image: AssetImage(Images.profile),
        ),
        SizedBox(height: 32),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.illustraion,
                width: 600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
