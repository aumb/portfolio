import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/introduction/profile_picture.dart';

class IntroductionWidget extends StatelessWidget {
  final Information information;

  const IntroductionWidget({this.information});

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
          information?.personalInformation?.jobTitle ?? '',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          information?.personalInformation?.jobSubtitle,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 56),
        ProfilePicture(
            size: 150, information: information?.personalInformation),
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
