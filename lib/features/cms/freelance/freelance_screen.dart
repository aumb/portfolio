import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/cms/freelance/add_edit_freelance_dialog.dart';
import 'package:portfolio/features/portfolio/portfolio_card.dart';

class FreelanceScreen extends StatefulWidget {
  final List<RecentWork> recentWork;
  final Function(List<RecentWork>) newInformation;

  const FreelanceScreen({
    this.recentWork,
    this.newInformation,
  });

  @override
  _FreelanceScreenState createState() => _FreelanceScreenState();
}

class _FreelanceScreenState extends State<FreelanceScreen> {
  List<RecentWork> _recentWork;

  @override
  void initState() {
    super.initState();
    _recentWork = [];
    _recentWork.addAll(widget.recentWork ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final RecentWork recentWork = await showDialog<RecentWork>(
            context: context,
            builder: (BuildContext context) => AddEditFreelanceDialog(),
          );

          if (recentWork != null) {
            _recentWork.add(recentWork);
          }
          if (mounted) setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: BSColumn(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "Projects",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              children: [
                ..._recentWork
                    .map(
                      (e) => PortfolioCard(
                        recentWork: e,
                        isEdit: true,
                        editedRecentWork: (v) {
                          if (v != null) {
                            if (v.id != -1) {
                              RecentWork _work = _recentWork.firstWhere(
                                (element) => element.id == v.id,
                                orElse: () => null,
                              );

                              _work?.url = v.url;
                              _work?.description = v.description;
                            } else {
                              int index = _recentWork
                                  .indexWhere((element) => element.id == e.id);

                              _recentWork.removeAt(index);
                            }
                            widget.newInformation(_recentWork);
                            if (mounted) setState(() {});
                          }
                        },
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
