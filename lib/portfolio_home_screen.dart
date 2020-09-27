import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/components/scaffold/portfolio_scaffold.dart';
import 'package:portfolio/features/about/about_widget.dart';
import 'package:portfolio/features/companies/companies_widget.dart';
import 'package:portfolio/features/contact/contact_widget.dart';
import 'package:portfolio/features/introduction/introduction_widget.dart';
import 'package:portfolio/features/portfolio/portfolio_widget.dart';
import 'package:portfolio/features/work/work_widget.dart';

class PortfolioHomeScreen extends StatefulWidget {
  @override
  _PortfolioHomeScreenState createState() => _PortfolioHomeScreenState();
}

class _PortfolioHomeScreenState extends State<PortfolioHomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return PortfolioScaffold(builder: (context) {
      return Stack(
        children: [
          Scrollbar(
            child: ListView(
              physics: BouncingScrollPhysics(),
              addAutomaticKeepAlives: true,
              cacheExtent: 6000.0,
              scrollDirection: Axis.vertical,
              children: [
                IntroductionWidget(),
                AboutWidget(),
                WorkWidget(),
                PortfolioWidget(),
                CompaniesWidget(),
                ContactWidget(),
              ],
            ),
          ),
        ],
      );
    });
  }
}
