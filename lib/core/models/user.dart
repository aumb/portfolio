class User {
  int id;
  String name;
  String email;
  String token;
  String refreshToken;

  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      Map<String, dynamic> user = json['user'];
      Map<String, dynamic> token = json['token'];

      return User(
        id: user['id'] != null ? user['id'] : null,
        name: user['name'] != null ? user['name'] : null,
        email: user['email'] != null ? user['email'] : null,
        token: token['access_token'] != null ? token['access_token'] : null,
        refreshToken:
            token['refresh_token'] != null ? token['refresh_token'] : null,
      );
    } else {
      return null;
    }
  }
}
