class User {
  final String token;
  final int id;
  final String username;
  final String email;
  final String birthdate;
  final int gender;

  User({
    required this.token,
    required this.id,
    required this.username,
    required this.email,
    required this.birthdate,
    required this.gender,
  });
}
