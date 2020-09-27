import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';

class CompaniesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return BSColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 24,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Companies I have worked with",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Wrap(
            spacing: 36,
            runSpacing: 24,
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
          ),
        )
      ],
    );
  }
}
