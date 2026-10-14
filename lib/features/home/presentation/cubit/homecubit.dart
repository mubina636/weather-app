import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/core/status/statushelper.dart';
import 'package:weatherapp/features/domain/entity/weatherentetity.dart';
import 'package:weatherapp/features/domain/usecase/getcurrentweather.dart';
import 'package:weatherapp/features/home/data/model/weather_requestmodel.dart';

class HomeCubit extends Cubit<HomeState> {
  final Getcurrentweather getcurrentweather;

  HomeCubit(this.getcurrentweather)
      : super(
          HomeState(
            statuses: {
              'currentWeather': Status.initial,
            },
          ),
        ) {
    print('HOME CUBIT CREATED');
  }

  Future<void> loadCurrentWeather({
    required String city,
  }) async {
    print('LOAD CURRENT WEATHER');

    emit(
      state.copyWith(
        statuses: {
          ...state.statuses,
          'currentWeather': Status.loading,
        },
      ),
    );

    try {
      final request = WeatherRequestmodel(
        city: city,
        units: 'metric',
      );

      print('REQUEST CREATED');

      final weather = await getcurrentweather(request);

      print('WEATHER SUCCESS: $weather');

      emit(
        state.copyWith(
          weather: weather,
          statuses: {
            ...state.statuses,
            'currentWeather': Status.success,
          },
        ),
      );
    } catch (e) {
      print(e);

      emit(
        state.copyWith(
          statuses: {
            ...state.statuses,
            'currentWeather': Status.error,
          },
        ),
      );
    }
  }
}

class HomeState {
  final Weatherentetity? weather;
  final Map<String, Status> statuses;

  const HomeState({
    this.weather,
    required this.statuses,
  });

  HomeState copyWith({
    Weatherentetity? weather,
    Map<String, Status>? statuses,
  }) {
    return HomeState(
      weather: weather ?? this.weather,
      statuses: statuses ?? this.statuses,
    );
  }
  Status statusof(String key){
    return statuses[key] ?? Status.initial;
  }


}