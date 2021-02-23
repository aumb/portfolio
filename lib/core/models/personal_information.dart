class PersonalInformation {
  int id;
  String name;
  String jobTitle;
  String jobSubtitle;
  String aboutTitle;
  String about;
  String email;
  String phoneNumber;
  String linkedInUrl;
  String facebookUrl;
  String instagramUrl;
  String twitterUrl;
  String githubUrl;
  String img;
  String contactTitle;
  String contactSubtitle;
  DateTime dob;
  DateTime createdAt;
  DateTime updatedAt;

  PersonalInformation({
    this.id,
    this.name,
    this.jobTitle,
    this.jobSubtitle,
    this.aboutTitle,
    this.about,
    this.email,
    this.phoneNumber,
    this.linkedInUrl,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.githubUrl,
    this.contactTitle,
    this.contactSubtitle,
    this.img,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  factory PersonalInformation.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return PersonalInformation(
        id: json['id'] != null ? json['id'] : null,
        name: json['name'] != null ? json['name'] : null,
        jobTitle: json['job_title'] != null ? json['job_title'] : null,
        jobSubtitle: json['job_subtitle'] != null ? json['job_subtitle'] : null,
        aboutTitle: json['about_title'] != null ? json['about_title'] : null,
        about: json['about'] != null ? json['about'] : null,
        email: json['email'] != null ? json['email'] : null,
        phoneNumber: json['phone_number'] != null ? json['phone_number'] : null,
        linkedInUrl:
            json['linked_in_url'] != null ? json['linked_in_url'] : null,
        facebookUrl: json['facebook_url'] != null ? json['facebook_url'] : null,
        instagramUrl:
            json['instagram_url'] != null ? json['instagram_url'] : null,
        twitterUrl: json['twitter_url'] != null ? json['twitter_url'] : null,
        githubUrl: json['github_url'] != null ? json['github_url'] : null,
        contactTitle:
            json['contact_title'] != null ? json['contact_title'] : null,
        contactSubtitle:
            json['contact_subtitle'] != null ? json['contact_subtitle'] : null,
        img: json['img'] != null ? json['img'] : null,
        dob: json['dob'] != null ? DateTime.tryParse(json['dob']) : null,
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
        'name': name,
        'job_title': jobTitle,
        'job_subtitle': jobSubtitle,
        'about_title': aboutTitle,
        'about': about,
        'contact_title': contactTitle,
        'contact_subtitle': contactSubtitle,
        'email': email,
        'phone_number': phoneNumber,
        'linked_in_url': linkedInUrl,
        'facebook_url': facebookUrl,
        'instagram_url': instagramUrl,
        'twitter_url': twitterUrl,
        'github_url': githubUrl,
      };
}
