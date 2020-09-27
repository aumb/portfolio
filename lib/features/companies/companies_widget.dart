import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';

class CompaniesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BSColumn(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      mainAxisAlignment: MainAxisAlignment.center,
      height: height * 0.8,
      children: [
        Text(
          "Companies I have worked with",
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60),
        Wrap(
          spacing: 36,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Image.asset(
              Images.ubanquity,
              width: 200,
            ),
            Image.asset(
              Images.inboundHorizons,
              width: 200,
            ),
            Image.asset(
              Images.easyBeirut,
              width: 200,
            ),
          ],
        )
      ],
    );
  }
}
