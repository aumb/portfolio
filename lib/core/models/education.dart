class Education {
  int id;
  String degree;
  String major;
  String universityName;
  String univeristyAbrv;
  DateTime endDate;
  DateTime createdAt;
  DateTime updatedAt;

  Education({
    this.id,
    this.degree,
    this.major,
    this.universityName,
    this.univeristyAbrv,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Education(
        id: json['id'] != null ? json['id'] : null,
        degree: json['degree'] != null ? json['degree'] : null,
        major: json['major'] != null ? json['major'] : null,
        universityName:
            json['university_name'] != null ? json['university_name'] : null,
        univeristyAbrv:
            json['university_abrv'] != null ? json['university_abrv'] : null,
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
}
