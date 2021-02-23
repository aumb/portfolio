import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/cms/companies/add_edit_job_dialog.dart';
import 'package:portfolio/features/companies/company_card.dart';

class CompaniesScreen extends StatefulWidget {
  final List<Job> jobs;
  final Function(List<Job>) newInformation;

  const CompaniesScreen({
    this.jobs,
    this.newInformation,
  });

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  List<Job> _jobs;

  @override
  void initState() {
    super.initState();
    _jobs = [];
    _jobs.addAll(widget.jobs ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Job _job = await showDialog<Job>(
            context: context,
            builder: (BuildContext context) => AddEditJobDialog(),
          );

          if (_job != null) {
            _jobs.add(_job);
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
                "Companies",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 24,
              alignment: WrapAlignment.start,
              children: [
                ..._jobs
                    .map((e) => CompanyCard(
                          job: e,
                          isEdit: true,
                          editedJob: (v) {
                            if (v != null) {
                              if (v.id != -1) {
                                Job _job = _jobs.firstWhere(
                                  (element) => element.id == v.id,
                                  orElse: () => null,
                                );
                                _job?.title = v.title;
                                _job?.companyName = v.companyName;
                                _job?.companyLink = v.companyLink;
                                _job?.description = v.description;
                                _job?.startDate = v.startDate;
                                _job?.endDate = v.endDate;
                              } else {
                                int index = _jobs.indexWhere(
                                    (element) => element.id == e.id);

                                _jobs.removeAt(index);
                              }
                              widget.newInformation(_jobs);
                              if (mounted) setState(() {});
                            }
                          },
                        ))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
