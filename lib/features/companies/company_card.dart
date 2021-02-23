import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/features/cms/companies/add_edit_job_dialog.dart';

class CompanyCard extends StatefulWidget {
  final Job job;
  final bool isEdit;
  final Function(Job) editedJob;

  const CompanyCard({
    this.job,
    this.isEdit = false,
    this.editedJob,
  });

  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            height: 600,
            width: 340,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInImage.assetNetwork(
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                    placeholder: Images.loadingGif,
                    image: API.host +
                        API.jobPicture +
                        "/" +
                        widget.job.id.toString()),
                SizedBox(height: 32),
                Text(
                  widget.job.title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                _buildStartToEndDate(context),
                SizedBox(height: 24),
                _buildExperience(context),
                SizedBox(height: 50),
              ],
            ),
          ),
          _buildAccent(context),
          Positioned(bottom: 0, child: _buildAccent(context)),
          if (widget.isEdit)
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () async {
                  final Job _job = await showDialog<Job>(
                    context: context,
                    builder: (BuildContext context) =>
                        AddEditJobDialog(job: widget.job),
                  );
                  if (mounted) setState(() {});
                  widget.editedJob(_job);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomColors.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.edit),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Container _buildAccent(BuildContext context) {
    return Container(
        height: 5, width: 340, color: Theme.of(context).accentColor);
  }

  Text _buildExperience(BuildContext context) {
    return Text(
      widget.job.description,
      style: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.start,
    );
  }

  Text _buildStartToEndDate(BuildContext context) {
    String endDate = widget.job.endDate != null
        ? getStrDate(widget.job.endDate, pattern: 'MMMM yyyy')
        : "current";
    return Text(
      getStrDate(widget.job.startDate, pattern: 'MMMM yyyy').toUpperCase() +
          " - " +
          endDate.toUpperCase(),
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(color: Theme.of(context).accentColor),
      textAlign: TextAlign.start,
    );
  }
}
