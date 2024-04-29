import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_handling_example/model/user.dart';
import 'package:riverpod_future_handling_example/provider/login_notifier_provider.dart';

class HomeScreenNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final user = ref.watch(logInNotifierProvider);;

    if (user == null) {
      await Future.delayed(const Duration(seconds: 2));
    }

    return user;
  }

  void login(bool hasError) {
    try {
      ref.read(logInNotifierProvider.notifier).login(hasError);
    } catch(e, s) {
      state = AsyncError(e, s);
    }
  }
}

final homeScreenStateProvider = AsyncNotifierProvider<HomeScreenNotifier, User?>(() => HomeScreenNotifier());