import 'package:get_it/get_it.dart';
import 'package:weatherapp/core/network/apiclient.dart';
import 'package:weatherapp/features/domain/usecase/getcurrentweather.dart';
import 'package:weatherapp/features/home/data/datasource/datasource.dart';
import 'package:weatherapp/features/home/data/repository/home_repository.dart';
import 'package:weatherapp/features/home/data/repository/homerepo_impl.dart';
import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';


final getIt=GetIt.instance;
void setupDependecies(){
  getIt.registerLazySingleton <ApiClient>(() => ApiClient(),);
  getIt.registerLazySingleton <Datasource>(() => Datasource(getIt<ApiClient>()));
  getIt.registerLazySingleton<HomeRepository>(() => HomerepoImpl(getIt<Datasource>()),);
  getIt.registerLazySingleton<Getcurrentweather>(() => Getcurrentweather(getIt<HomeRepository>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<Getcurrentweather>()));
}