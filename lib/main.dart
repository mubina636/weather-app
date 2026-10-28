import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:go_router/go_router.dart";
import "package:weatherapp/features/home/data/repository/home_repository.dart";
import "package:weatherapp/core/network/apiclient.dart";
import "package:weatherapp/features/domain/usecase/getcurrentweather.dart";
import "package:weatherapp/features/domain/usecase/getforecast.dart";
import "package:weatherapp/features/domain/usecase/getnotification.dart";
import "package:weatherapp/features/home/data/datasource/datasource.dart";
import "package:weatherapp/features/home/data/datasource/notificationdatasource.dart";
import "package:weatherapp/features/home/data/repository/forecastimpl.dart";
import "package:weatherapp/features/home/data/repository/homerepo_impl.dart";
import "package:weatherapp/features/home/data/repository/notificationimpl.dart";
import "package:weatherapp/features/home/presentation/cubit/detailcubit.dart";
import "package:weatherapp/features/home/presentation/cubit/homecubit.dart";
import "package:weatherapp/features/home/presentation/cubit/notificationcubit.dart";
import "package:weatherapp/features/home/presentation/screen/detail.screen.dart";
import "package:weatherapp/features/home/presentation/screen/map.dart";

import "package:weatherapp/features/home/presentation/screen/notification.dart";
import "package:weatherapp/features/home/presentation/screen/screenspage.dart";


import 'package:yandex_maps_mapkit/init.dart' as mapkit_init;

const mapkitApikey = String.fromEnvironment('MAPKIT_API_KEY');

final getIt = GetIt.instance;

void setupDependencies() {
getIt.registerLazySingleton(() => ApiClient());

getIt.registerLazySingleton(
() => NotificationDatasource(getIt()),
);
getIt.registerLazySingleton<HomeRepository>(
  () => HomerepoImpl(getIt<Datasource>()),
);
getIt.registerLazySingleton(
() => NotificationRepositoryImpl(
getIt(),
),
);

getIt.registerLazySingleton(
() => Datasource(getIt()),
);

getIt.registerLazySingleton(
() => HomerepoImpl(getIt()),
);

getIt.registerLazySingleton(
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

final GoRouter appRouter = GoRouter(
initialLocation: '/',
routes: [
GoRoute(
path: '/',
builder: (context, state) => Homescreen(),
),
GoRoute(
path: '/detail',
builder: (context, state) => const Detailscreen(),
),
GoRoute(
path: '/notification',
builder: (context, state) => Notificationpage(),
),
GoRoute(
path: '/map',
builder: (context, state) =>MapScreen()
),
],
);

Future main() async {
WidgetsFlutterBinding.ensureInitialized();

await mapkit_init.initMapkit(
apiKey: mapkitApikey,
);

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