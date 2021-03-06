import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class WorkCard extends StatelessWidget {
  final String image;
  final String workType;
  final List<String> languages;
  final List<String> tools;

  const WorkCard({
    this.image,
    this.workType,
    this.languages,
    this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: Theme.of(context).accentColor,
              width: 50,
            ),
            SizedBox(height: 32),
            Text(
              workType,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              Strings.languages,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: 8),
            _buildLanguages(context),
            SizedBox(height: 50),
            Text(
              Strings.toolsAndFrameworks,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: 8),
            _buildTools(context),
          ],
        ),
      ),
    );
  }

  Text _buildLanguages(BuildContext context) {
    String languages = '';
    for (int i = 0; i < this.languages.length; i++) {
      languages += this.languages[i];
      if (i < this.languages.length - 1) languages += ", ";
    }
    return Text(
      languages,
      style: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.center,
    );
  }

  Column _buildTools(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < tools.length; i++) {
      items.add(Text(
        tools[i],
        style: Theme.of(context).textTheme.bodyText1,
      ));
      if (i < tools.length - 1) items.add(SizedBox(height: 6));
    }
    return Column(children: items);
  }
}
