class User {
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String profilePictureUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }
}
