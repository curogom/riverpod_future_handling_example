import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_handling_example/model/user.dart';

class LoginNotifier extends StateNotifier<User?> {
  LoginNotifier() : super(null);

  void login(bool hasError) {
    if (hasError) {
      throw Exception('Login failed');
    } else {
      final words = generateWordPairs().take(1).first;
      final userName = words.asCamelCase;
      state = User(userName: userName, loginTime: DateTime.now());
    }
  }

  void logout() => state = null;
}

final logInNotifierProvider = StateNotifierProvider<LoginNotifier, User?>((ref) => LoginNotifier());
