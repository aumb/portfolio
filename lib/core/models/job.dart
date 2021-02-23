import 'package:portfolio/core/utils/utils.dart';

class Job {
  int id;
  String title;
  String companyName;
  String companyLink;
  String description;
  String image;
  DateTime startDate;
  DateTime endDate;
  DateTime createdAt;
  DateTime updatedAt;

  Job({
    this.id,
    this.title,
    this.companyName,
    this.companyLink,
    this.description,
    this.image,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Job(
        id: json['id'] != null ? json['id'] : null,
        title: json['title'] != null ? json['title'] : null,
        companyName: json['company_name'] != null ? json['company_name'] : null,
        companyLink: json['company_link'] != null ? json['company_link'] : null,
        description: json['description'] != null ? json['description'] : null,
        image: json['img'] != null ? json['img'] : null,
        startDate: json['start_date'] != null
            ? DateTime.tryParse(json['start_date'])
            : null,
        endDate: json['end_date'] != null
            ? DateTime.tryParse(json['end_date'])
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
      );
    } else {
      return null;
    }
  }

  static List<Job> fromJsonList(List json) {
    if (json != null && json.isNotEmpty) {
      List<Job> jobs = json.map((job) => Job.fromJson(job)).toList();
      return jobs;
    } else {
      return [];
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'company_name': companyName,
        'company_link': companyLink,
        'description': description,
        'start_date': getStrDate(startDate, pattern: 'yyyy-MM-dd'),
        'end_date': getStrDate(endDate, pattern: 'yyyy-MM-dd'),
      };
}
