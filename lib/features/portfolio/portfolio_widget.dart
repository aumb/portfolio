import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/portfolio/portfolio_card.dart';

class PortfolioWidget extends StatelessWidget {
  final List<RecentWork> recentWork;

  const PortfolioWidget({this.recentWork});

  @override
  Widget build(BuildContext context) {
    return BSColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).accentColor,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      children: [
        Text(
          Strings.recentWork,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          Strings.recentWorkSubtitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 64),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          children: [
            ...recentWork
                .map(
                  (e) => PortfolioCard(recentWork: e),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
