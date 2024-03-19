import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/core/routes/app_routes.dart';
import 'package:yugioh/core/theme/theme_app.dart';
import 'package:yugioh/pages/home/home_cubit.dart';
import 'package:yugioh/pages/list_games/list_games_cubit.dart';
import 'package:yugioh/repositories/home_repository.dart';
import 'package:yugioh/repositories/home_repository_impl.dart';

class ProviderCubit extends StatelessWidget {
  const ProviderCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HomeRepositoryImpl(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                LifeCounterCubit(context.read<HomeRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                ListGamesCubit(context.read<HomeRepositoryImpl>()),
          )
        ],
        child: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
