class UserModel {
  String? email;
  String? firstName; // 0 for expense, 1 for earning
  String? lastName; // 0 for expense, 1 for earning

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName']
    );
  }
}