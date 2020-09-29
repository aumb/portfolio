import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';

class CompanyCard extends StatelessWidget {
  final Job job;

  const CompanyCard({
    this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            height: 600,
            width: 320,
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
                    image: API.host + API.jobPicture + "/" + job.id.toString()),
                SizedBox(height: 32),
                Text(
                  job.title,
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
          Container(
              height: 5, width: 320, color: Theme.of(context).accentColor),
          Positioned(
            bottom: 0,
            child: Container(
                height: 5, width: 320, color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }

  Text _buildExperience(BuildContext context) {
    return Text(
      job.description,
      style: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.start,
    );
  }

  Text _buildStartToEndDate(BuildContext context) {
    String endDate = job.endDate != null
        ? getStrDate(job.endDate, pattern: 'MMMM yyyy')
        : "current";
    return Text(
      getStrDate(job.startDate, pattern: 'MMMM yyyy').toUpperCase() +
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
