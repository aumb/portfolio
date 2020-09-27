import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/features/portfolio/portfolio_card.dart';

class PortfolioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BSColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).accentColor,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      children: [
        Text(
          "My Recent Work",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          "Here are a few projects I've worked on recently.",
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
            PortfolioCard(
              title:
                  "High end mobile banking integration for customers and banks",
              image: Images.ubanquity,
              underDevelopment: false,
              onTap: () {
                launchUrls(scheme: 'https', path: 'https://www.ubanquity.com/');
              },
            ),
            PortfolioCard(
              title: "Stationary portfolio & company information",
              image: Images.easyBeirut,
              underDevelopment: false,
              onTap: () {
                launchUrls(
                    scheme: 'https', path: 'https://www.easybeirut.com/');
              },
            ),
            PortfolioCard(
              title: "Search engine for gaming lounges and esports",
              image: Images.gameCircle,
              onTap: () {},
              underDevelopment: true,
            ),
          ],
        ),
      ],
    );
  }
}
