import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/scaffold/portfolio_scaffold.dart';
import 'package:portfolio/core/core.dart';

class EditMainScreen extends StatefulWidget {
  @override
  _EditMainScreenState createState() => _EditMainScreenState();
}

class _EditMainScreenState extends State<EditMainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabController.length,
        child: PortfolioScaffold(
          builder: (BuildContext context) => BSColumn(
            children: [
              _buildBackButton(),
              _buildTabBar(),
              Expanded(child: _buildTabBarViews()),
            ],
          ),
        ));
  }

  Row _buildBackButton() {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
        ),
        Tab(
          icon: Icon(Icons.work),
        ),
        Tab(
          icon: Icon(Icons.business),
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
          SizedBox.shrink(),
          SizedBox.shrink(), SizedBox.shrink(),
          // _buildSectionAccordingToState(
          //   list: LPCategoryIconListView(
          //     categories: categories,
          //     total: categoriesAmount,
          //     onTap: (category) {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (_) => LPPfmTransactionList(
          //           initialDate: _currentDate,
          //           category: category,
          //           changeDate: _dateChanged,
          //         ),
          //       ));
          //     },
          //   ),
          // ),
          // _buildSectionAccordingToState(
          //   list: LPMerchantList(
          //     merchants: merchants,
          //     total: merchantsAmount,
          //     onTap: (merchant) {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (_) => LPPfmTransactionList(
          //           initialDate: _currentDate,
          //           merchant: merchant,
          //           changeDate: _dateChanged,
          //         ),
          //       ));
          //     },
          //   ),
          // ),
          // _buildSectionAccordingToState(
          //   list: LPTagList(
          //     tags: tags,
          //     total: tagsAmount,
          //     onTap: (tag) {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (_) => LPPfmTransactionList(
          //           initialDate: _currentDate,
          //           tag: tag,
          //           changeDate: _dateChanged,
          //         ),
          //       ));
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
