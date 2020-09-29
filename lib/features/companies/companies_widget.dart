import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/companies/company_card.dart';

class CompaniesWidget extends StatefulWidget {
  final List<Job> jobs;

  const CompaniesWidget({this.jobs});

  @override
  _CompaniesWidgetState createState() => _CompaniesWidgetState();
}

class _CompaniesWidgetState extends State<CompaniesWidget> {
  List<Job> _jobs;

  @override
  void initState() {
    super.initState();
    _jobs = widget.jobs;
    _jobs.sort((b, a) => a.startDate.compareTo(b.startDate));
  }

  @override
  Widget build(BuildContext context) {
    return BSColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
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
        Wrap(
          spacing: 16,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ..._jobs
                .map((e) => CompanyCard(
                      job: e,
                    ))
                .toList(),
          ],
        )
      ],
    );
  }
}
