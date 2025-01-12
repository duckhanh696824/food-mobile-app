class User {
  User({
    required this.id,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? id;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      email: json["email"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
