import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/contact_button.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';

class ContactWidget extends StatelessWidget {
  final PersonalInformation personalInformation;

  const ContactWidget({this.personalInformation});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BSColumn(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).accentColor,
      height: height * 0.8,
      children: [
        Text(
          personalInformation?.contactTitle,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 44),
        Text(
          personalInformation?.contactSubtitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            if (isNotEmpty(personalInformation?.githubUrl))
              ContactButton(
                size: 40,
                icon: MdiIcons.github,
                onPressed: () {
                  launchUrls(
                    scheme: 'https',
                    path: personalInformation.githubUrl,
                  );
                },
              ),
            if (isNotEmpty(personalInformation?.linkedInUrl))
              ContactButton(
                disabled: false,
                isLoading: false,
                size: 40,
                icon: MdiIcons.linkedin,
                onPressed: () {
                  launchUrls(
                    scheme: 'https',
                    path: personalInformation.linkedInUrl,
                  );
                },
              ),
            if (isNotEmpty(personalInformation?.email))
              ContactButton(
                disabled: false,
                isLoading: false,
                size: 40,
                icon: MdiIcons.email,
                onPressed: () {
                  launchUrls(
                    scheme: 'mailto',
                    path: personalInformation.email,
                  );
                },
              ),
            if (isNotEmpty(personalInformation?.facebookUrl))
              ContactButton(
                disabled: false,
                isLoading: false,
                size: 40,
                icon: MdiIcons.facebook,
                onPressed: () {
                  launchUrls(
                    scheme: 'https',
                    path: personalInformation.facebookUrl,
                  );
                },
              ),
            if (isNotEmpty(personalInformation?.instagramUrl))
              ContactButton(
                disabled: false,
                isLoading: false,
                size: 40,
                icon: MdiIcons.instagram,
                onPressed: () {
                  launchUrls(
                    scheme: 'https',
                    path: personalInformation.instagramUrl,
                  );
                },
              ),
            if (isNotEmpty(personalInformation?.twitterUrl))
              ContactButton(
                disabled: false,
                isLoading: false,
                size: 40,
                icon: MdiIcons.twitter,
                onPressed: () {
                  launchUrls(
                    scheme: 'https',
                    path: personalInformation.twitterUrl,
                  );
                },
              ),
          ],
        )
      ],
    );
  }
}
