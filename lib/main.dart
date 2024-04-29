import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_handling_example/example_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ExampleApp(),
    ),
  );
}