class RecentWork {
  int id;
  String url;
  String img;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  RecentWork({
    this.id,
    this.url,
    this.img,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory RecentWork.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return RecentWork(
        id: json['id'] != null ? json['id'] : null,
        url: json['url'] != null ? json['url'] : null,
        img: json['img'] != null ? json['img'] : null,
        description: json['description'] != null ? json['description'] : null,
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'description': description,
      };

  static List<RecentWork> fromJsonList(List json) {
    if (json != null && json.isNotEmpty) {
      List<RecentWork> recentWork =
          json.map((recentWork) => RecentWork.fromJson(recentWork)).toList();
      return recentWork;
    } else {
      return [];
    }
  }
}
