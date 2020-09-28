import 'package:portfolio/core/core.dart';

class Information {
  Education education;
  PersonalInformation personalInformation;
  List<Job> jobs;
  List<RecentWork> recentWork;

  Information({
    this.education,
    this.personalInformation,
    this.jobs,
    this.recentWork,
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
        recentWork: json['recent_work'] != null
            ? RecentWork.fromJsonList(json['recent_work'])
            : null,
      );
    } else {
      return null;
    }
  }
}
