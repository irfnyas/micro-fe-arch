import 'package:flutter/material.dart';
import 'package:microfearch/native_screen.dart';
import 'package:microfearch/web_screen.dart';

/// Set test view: true for native, false for web.
final nativeMode = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: nativeMode ? const NativeScreen() : const WebScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
