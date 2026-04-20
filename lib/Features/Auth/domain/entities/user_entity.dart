class UserEntity {
  final String name;
  final String email;
  final String password;

  UserEntity({required this.name, required this.email, required this.password});
  toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,};
  }
}
