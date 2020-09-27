import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/contact_button.dart';
import 'package:portfolio/core/utils/utils.dart';

class ContactWidget extends StatelessWidget {
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
          "Living and learning one day at a time.",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 44),
        Text(
          "Get in touch",
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
            ContactButton(
              size: 40,
              icon: MdiIcons.github,
              onPressed: () {
                launchUrls(scheme: 'https', path: "https://github.com/aumb");
              },
            ),
            ContactButton(
              disabled: false,
              isLoading: false,
              size: 40,
              icon: MdiIcons.linkedin,
              onPressed: () {
                launchUrls(
                    scheme: 'https',
                    path:
                        "https://www.linkedin.com/in/mathiew-abbas-3b2b5b112");
              },
            ),
            ContactButton(
              disabled: false,
              isLoading: false,
              size: 40,
              icon: MdiIcons.email,
              onPressed: () {
                launchUrls(scheme: 'mailto', path: "mathiewabbas@gmail.com");
              },
            ),
            ContactButton(
              disabled: false,
              isLoading: false,
              size: 40,
              icon: MdiIcons.facebook,
              onPressed: () {
                launchUrls(
                    scheme: 'https',
                    path: "https://facebook.com/mathiew.abbas");
              },
            ),
            ContactButton(
              disabled: false,
              isLoading: false,
              size: 40,
              icon: MdiIcons.instagram,
              onPressed: () {
                launchUrls(
                    scheme: 'https',
                    path: "https://instagram.com/mathiewabbas");
              },
            ),
            // ContactButton(
            //   disabled: false,
            //   isLoading: false,
            //   size: 40,
            //   icon: MdiIcons.twitter,
            //   onPressed: () {},
            // ),
          ],
        )
      ],
    );
  }
}
