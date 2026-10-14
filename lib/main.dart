import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/network/apiclient.dart';
import 'package:weatherapp/features/domain/usecase/getcurrentweather.dart';
import 'package:weatherapp/features/domain/usecase/getforecast.dart';
import 'package:weatherapp/features/domain/usecase/getnotification.dart';
import 'package:weatherapp/features/home/data/datasource/datasource.dart';
import 'package:weatherapp/features/home/data/datasource/notificationdatasource.dart';
import 'package:weatherapp/features/home/data/repository/forecastimpl.dart';
import 'package:weatherapp/features/home/data/repository/forecastrepo.dart';
import 'package:weatherapp/features/home/data/repository/home_repository.dart';
import 'package:weatherapp/features/home/data/repository/homerepo_impl.dart';
import 'package:weatherapp/features/home/data/repository/notificationimpl.dart';
import 'package:weatherapp/features/home/data/repository/notificationrepo.dart';
import 'package:weatherapp/features/home/presentation/cubit/detailcubit.dart';
import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';
import 'package:weatherapp/features/home/presentation/cubit/notificationcubit.dart';
import 'package:weatherapp/features/home/presentation/screen/detail.screen.dart';
import 'package:weatherapp/features/home/presentation/screen/notification.dart';
import 'package:weatherapp/features/home/presentation/screen/screenspage.dart';

// import 'package:weatherapp/core/network/apiclient.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // ApiClient


  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerLazySingleton<NotificationDatasource>(
    () => NotificationDatasource(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<Notificationrepo>(
    () => NotificationRepositoryImpl(getIt<NotificationDatasource>()),
  );

  getIt.registerLazySingleton<Datasource>(() => Datasource(getIt<ApiClient>()));
;

  

  getIt.registerLazySingleton<HomeRepository>(
    () => HomerepoImpl(getIt<Datasource>()),
  );

  getIt.registerLazySingleton<Forecastrepo>(
    () => ForecastRepositoryImpl(getIt<Datasource>()),
  );

  getIt.registerLazySingleton<Getcurrentweather>(
    () => Getcurrentweather(getIt<HomeRepository>()),
  );

  getIt.registerLazySingleton<Getforecast>(
    () => Getforecast(getIt<Forecastrepo>()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<Getcurrentweather>()));

  getIt.registerFactory<DetailCubit>(() => DetailCubit(getIt<Getforecast>()));
  getIt.registerLazySingleton<Getnotification>(
    () => Getnotification(getIt<Notificationrepo>()),
  );
  getIt.registerFactory<NotificationCubit>(
    () => NotificationCubit(getIt<Getnotification>()),
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => Homescreen()),
    GoRoute(path: '/detail', builder: (context, state) => const Detailscreen()),
    GoRoute(
      path: '/notification',
      builder: (context, state) => Notificationpage(),
    ),
  ],
);

void main() {
  setupDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
        BlocProvider<DetailCubit>(create: (_) => getIt<DetailCubit>()),
        BlocProvider<NotificationCubit>(
          create: (_) => getIt<NotificationCubit>(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
