import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/scaffold/portfolio_scaffold.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/cms/companies/companies_screen.dart';
import 'package:portfolio/features/cms/freelance/freelance_screen.dart';
import 'package:portfolio/features/cms/personal_information/personal_information_screen.dart';

class CmsScreen extends StatefulWidget {
  final Information information;

  const CmsScreen({this.information});

  @override
  _CmsScreenState createState() => _CmsScreenState();
}

class _CmsScreenState extends State<CmsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Information _information;

  @override
  void initState() {
    super.initState();
    _information = widget.information;
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: PortfolioScaffold(
        builder: (BuildContext context) => BSColumn(
          children: [
            SafeArea(child: _buildBackButton()),
            _buildTabBar(),
            Expanded(child: _buildTabBarViews()),
          ],
        ),
      ),
    );
  }

  Row _buildBackButton() {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(true);
            })
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      physics: NeverScrollableScrollPhysics(),
      unselectedLabelColor: CustomColors.white87,
      labelColor: CustomColors.accentColor,
      controller: _tabController,
      tabs: [
        Tab(
          icon: Icon(Icons.person),
          text: Strings.personal,
        ),
        Tab(
          icon: Icon(Icons.work),
          text: Strings.freelance,
        ),
        Tab(
          icon: Icon(Icons.business),
          text: Strings.companies,
        ),
      ],
    );
  }

  Widget _buildTabBarViews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PersonalInformationScreen(
            personal: _information.personalInformation,
            newInformation: (v) {
              if (v != null) {
                _information.personalInformation = v;
                if (mounted) setState(() {});
              }
            },
          ),
          FreelanceScreen(
            recentWork: _information.recentWork,
            newInformation: (v) {
              if (v != null) {
                _information.recentWork = [];
                _information.recentWork.addAll(v);
                if (mounted) setState(() {});
              }
            },
          ),
          CompaniesScreen(
            jobs: _information.jobs,
            newInformation: (v) {
              if (v != null) {
                _information.jobs = [];
                _information.jobs.addAll(v);
                if (mounted) setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
