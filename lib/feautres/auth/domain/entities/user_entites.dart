class UserEntities {
  final String email;
  final String name;
  final String uId;

  UserEntities({required this.email, required this.name, required this.uId});

  toMap() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
    };
  }
}
