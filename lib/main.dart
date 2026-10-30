// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';

// import 'package:weatherapp/core/network/apiclient.dart';

// import 'package:weatherapp/features/domain/usecase/getcurrentweather.dart';
// import 'package:weatherapp/features/domain/usecase/getforecast.dart';
// import 'package:weatherapp/features/domain/usecase/getnotification.dart';

// import 'package:weatherapp/features/home/data/datasource/datasource.dart';
// import 'package:weatherapp/features/home/data/datasource/notificationdatasource.dart';

// import 'package:weatherapp/features/home/data/repository/forecastrepo.dart';
// import 'package:weatherapp/features/home/data/repository/home_repository.dart';
// import 'package:weatherapp/features/home/data/repository/forecastimpl.dart';
// import 'package:weatherapp/features/home/data/repository/homerepo_impl.dart';
// import 'package:weatherapp/features/home/data/repository/notificationimpl.dart';

// import 'package:weatherapp/features/home/presentation/cubit/detailcubit.dart';
// import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';
// import 'package:weatherapp/features/home/presentation/cubit/notificationcubit.dart';

// import 'package:weatherapp/features/home/presentation/screen/detail.screen.dart';
//  // Убедитесь, что путь к HomeScreen корректен
// import 'package:weatherapp/features/home/presentation/screen/map.dart';
// import 'package:weatherapp/features/home/presentation/screen/notification.dart';
// import 'package:weatherapp/features/home/presentation/screen/screenspage.dart';

// import 'package:yandex_maps_mapkit/init.dart' as init;
// import 'package:yandex_maps_mapkit/mapkit_factory.dart';

// // GetIt
// final getIt = GetIt.instance;

// // Dependencies
// void setupDependencies() {
//   getIt.registerLazySingleton(() => ApiClient());

//   getIt.registerLazySingleton(
//     () => Datasource(getIt()),
//   );

//   getIt.registerLazySingleton(
//     () => NotificationDatasource(getIt()),
//   );

//   getIt.registerLazySingleton<HomeRepository>(
//     () => HomerepoImpl(getIt<Datasource>()),
//   );

//   getIt.registerLazySingleton(
//     () => NotificationRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton<Forecastrepo>(
//     () => ForecastRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(
//     () => Getcurrentweather(getIt()),
//   );

//   getIt.registerLazySingleton(
//     () => Getforecast(getIt()),
//   );

//   getIt.registerLazySingleton(
//     () => Getnotification(getIt()),
//   );

//   getIt.registerFactory(
//     () => HomeCubit(getIt()),
//   );

//   getIt.registerFactory(
//     () => DetailCubit(getIt()),
//   );

//   getIt.registerFactory(
//     () => NotificationCubit(getIt()),
//   );
// }

// // GoRouter
// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Homescreen(),
//     ),
//     GoRoute(
//       path: '/detail',
//       builder: (context, state) => const Detailscreen(),
//     ),
//     GoRoute(
//       path: '/notification',
//       builder: (context, state) => const Notificationpage(),
//     ),
//     GoRoute(
//       path: '/map',
//       builder: (context, state) => const MapScreen(),
//     ),
//   ],
// );

// // Main
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // ⚠️ Замените 'ВАШ_РЕАЛЬНЫЙ_API_КЛЮЧ' на ваш реальный ключ MapKit, 
//   // полученный в Кабинете разработчика Яндекса (для Android/iOS).
//   await init.initMapkit(
//     apiKey: '99156d5a-9c3b-4eaa-9810-2afb1fbc100a',
    
//   );

//   mapkit.onStart();

//   // Initialize dependencies
//   setupDependencies();

//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => getIt<HomeCubit>(),
//         ),
//         BlocProvider(
//           create: (context) => getIt<DetailCubit>(),
//         ),
//         BlocProvider(
//           create: (context) => getIt<NotificationCubit>(),
//         ),
//       ],
//       child: const App(),
//     ),
//   );
// }

// // App
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: appRouter,
//     );
//   }
// }


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

import 'package:weatherapp/features/home/data/repository/forecastrepo.dart';
import 'package:weatherapp/features/home/data/repository/home_repository.dart';
import 'package:weatherapp/features/home/data/repository/forecastimpl.dart';
import 'package:weatherapp/features/home/data/repository/homerepo_impl.dart';
import 'package:weatherapp/features/home/data/repository/notificationimpl.dart';

import 'package:weatherapp/features/home/presentation/cubit/detailcubit.dart';
import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';
import 'package:weatherapp/features/home/presentation/cubit/notificationcubit.dart';

import 'package:weatherapp/features/home/presentation/screen/detail.screen.dart';
import 'package:weatherapp/features/home/presentation/screen/map.dart';
import 'package:weatherapp/features/home/presentation/screen/notification.dart';
import 'package:weatherapp/features/home/presentation/screen/screenspage.dart';

import 'package:yandex_maps_mapkit/init.dart' as init;
import 'package:yandex_maps_mapkit/mapkit_factory.dart';

// GetIt
final getIt = GetIt.instance;

// Dependencies
void setupDependencies() {
  getIt.registerLazySingleton(() => ApiClient());

  getIt.registerLazySingleton(
    () => Datasource(getIt()),
  );

  getIt.registerLazySingleton(
    () => NotificationDatasource(getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomerepoImpl(getIt<Datasource>()),
  );

  getIt.registerLazySingleton(
    () => NotificationRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<Forecastrepo>(
    () => ForecastRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(
    () => Getcurrentweather(getIt()),
  );

  getIt.registerLazySingleton(
    () => Getforecast(getIt()),
  );

  getIt.registerLazySingleton(
    () => Getnotification(getIt()),
  );

  getIt.registerFactory(
    () => HomeCubit(getIt()),
  );

  getIt.registerFactory(
    () => DetailCubit(getIt()),
  );

  getIt.registerFactory(
    () => NotificationCubit(getIt()),
  );
}

// GoRouter
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => const Detailscreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const Notificationpage(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
    ),
  ],
);

// Main
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация MapKit (только один раз)
  await init.initMapkit(
    apiKey: '99156d5a-9c3b-4eaa-9810-2afb1fbc100a', // твой ключ
  );

  // Зависимости
  setupDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DetailCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<NotificationCubit>(),
        ),
      ],
      child: const App(),
    ),
  );
}

// App
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    mapkit.onStart(); // обязательно
  }

  @override
  void dispose() {
    mapkit.onStop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      mapkit.onStart();
    } else if (state == AppLifecycleState.paused) {
      mapkit.onStop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}