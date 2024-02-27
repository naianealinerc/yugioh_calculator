import 'package:flutter/material.dart';
import 'package:yugioh/core/theme/theme_app.dart';
import 'package:yugioh/core/providers/provider_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const ProviderCubit(),
    );
  }
}
