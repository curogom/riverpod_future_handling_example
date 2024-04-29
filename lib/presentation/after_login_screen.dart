import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_handling_example/provider/login_notifier_provider.dart';

class AfterLoginScreen extends ConsumerWidget {
  const AfterLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(logInNotifierProvider)!;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Success'),
            Text(user.userName),
            Text(user.loginTime.toIso8601String()),
            TextButton(
              onPressed: () {
                ref.read(logInNotifierProvider.notifier).logout();
                Navigator.of(context).pop();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
