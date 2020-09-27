import 'package:flutter/material.dart';
import 'package:portfolio/components/scaffold/portfolio_scaffold.dart';
import 'package:portfolio/core/core.dart';
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
  HomeController controller;

  @override
  void initState() {
    super.initState();
    NetworkManager().init();
    controller = HomeController();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: controller.pageStream,
        builder: (context, snapshot) {
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            onRefresh: () => _init(isRefresh: true),
            child: PortfolioScaffold(
                state: AppState(
                  pageState: controller.pageState,
                  onRetry: _init,
                ),
                builder: (context) {
                  return Stack(
                    children: [
                      Scrollbar(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          addAutomaticKeepAlives: true,
                          cacheExtent: 6000.0,
                          scrollDirection: Axis.vertical,
                          children: [
                            IntroductionWidget(
                              information: controller.information,
                            ),
                            AboutWidget(
                                personalInformation: controller
                                    .information?.personalInformation),
                            WorkWidget(),
                            PortfolioWidget(),
                            CompaniesWidget(),
                            ContactWidget(
                              personalInformation:
                                  controller.information?.personalInformation,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          );
        });
  }

  Future<void> _init({bool isRefresh}) {
    if (isRefresh ?? false) {
      ProfilePictureController().getUserProfilePicture(
          controller.information?.personalInformation?.id);
      return controller.refreshInformation();
    } else {
      return controller.getInformation();
    }
  }
}
