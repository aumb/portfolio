import 'package:portfolio/core/core.dart';

class Information {
  Education education;
  PersonalInformation personalInformation;
  List<Job> jobs;

  Information({
    this.education,
    this.personalInformation,
    this.jobs,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Information(
        personalInformation: json['personal_information'] != null
            ? PersonalInformation.fromJson(json['personal_information'])
            : null,
        education: json['education'] != null
            ? Education.fromJson(json['education'])
            : null,
        jobs: json['jobs'] != null ? Job.fromJsonList(json['jobs']) : null,
      );
    } else {
      return null;
    }
  }
}
