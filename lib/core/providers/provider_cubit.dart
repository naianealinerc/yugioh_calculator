import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/main.dart';
import 'package:yugioh/pages/home/home_cubit.dart';
import 'package:yugioh/pages/home/home_page.dart';
import 'package:yugioh/repositories/home_repository.dart';
import 'package:yugioh/repositories/home_repository_impl.dart';

class ProviderCubit extends StatelessWidget {
  const ProviderCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LifeCounterCubit(HomeRepositoryImpl()),
        ),
      ],
      child: const MainApp(),
    );
  }
}
