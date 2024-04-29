import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_handling_example/presentation/after_login_screen.dart';
import 'package:riverpod_future_handling_example/provider/home_screen_state_provider.dart';
import 'package:riverpod_future_handling_example/provider/login_notifier_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeScreenStateProvider.notifier);
    final screenState = ref.watch(homeScreenStateProvider);
    late Widget child;

    if (screenState.isLoading) {
      child = const Center(child: CircularProgressIndicator());
    } else {
      if (screenState.hasError) {
        final error = screenState.error;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(error.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        });
      }

      if (screenState.hasValue) {
        if (screenState.value != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AfterLoginScreen()),
            ),
          );
        }
      }
    }

    child = SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: () => notifier.login(false), child: const Text('Success Login')),
          TextButton(onPressed: () => notifier.login(true), child: const Text('Failure Login')),
        ],
      ),
    );

    return Scaffold(
      body: child,
    );
  }
}
