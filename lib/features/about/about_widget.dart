import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BSColumn(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).accentColor,
      height: height * 0.8,
      children: [
        Text(
          "Hi, I’m Mathiew. Nice to meet you.",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          "Since beginning my journey as a front-end developer nearly 2 years ago, I've done remote work for companies, consulted for startups, and collaborated with talented people to create digital products for both business and consumer use. I'm very out-going, curious by nature, and a problem solver.",
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
