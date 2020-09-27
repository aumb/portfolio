import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/work/work_card.dart';

class WorkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BSColumn(
      children: [
        FractionalTranslation(
          translation: Offset(0, -0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WorkCard(
                image: Images.sourceCode,
                workType: "Front-end Developer",
                languages: [
                  "Dart",
                  "Java",
                  "HTML",
                  "CSS",
                  "Javascript",
                  "PHP",
                  "TypeScript",
                ],
                tools: [
                  "VS Code",
                  "Github",
                  "Gitlab",
                  "Flutter",
                  "Laravel",
                  "Angular"
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
