import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/cubit/filtered_cubit.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:pet_finder_app/feature/home/presentation/views/home_view.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeCubit(getIt())),
              BlocProvider(create: (context) => FilteredCubit(getIt())),
            ],
            child: const HomeView(),
          ),
        );
      default:
        return null;
    }
  }
}
