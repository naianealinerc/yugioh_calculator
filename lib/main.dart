import 'package:flutter/material.dart';
import 'package:yugioh/core/providers/provider_cubit.dart';
import 'package:yugioh/core/theme/theme_app.dart';
import 'package:yugioh/core/routes/app_routes.dart';

void main() {
  runApp(const ProviderCubit());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
      // builder: (context, child) {
      //   return Overlay(
      //     initialEntries: [
      //       OverlayEntry(
      //         builder: (context) => const ProviderCubit(),
      //       ),
      //     ],
      //   );
      // },
    );
  }
}
