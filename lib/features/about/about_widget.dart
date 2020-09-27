import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';

class AboutWidget extends StatelessWidget {
  final PersonalInformation personalInformation;

  const AboutWidget({this.personalInformation});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BSColumn(
      padding:
          EdgeInsets.symmetric(horizontal: width * 0.2, vertical: height * 0.2),
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).accentColor,
      children: [
        Text(
          personalInformation?.aboutTitle,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          personalInformation?.about,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
