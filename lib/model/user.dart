class User {
  final String userName;
  final DateTime loginTime;

  const User({
    required this.userName,
    required this.loginTime,
  });

  User copyWith({
    String? userName,
    DateTime? loginTime,
  }) {
    return User(
      userName: userName ?? this.userName,
      loginTime: loginTime ?? this.loginTime,
    );
  }
}