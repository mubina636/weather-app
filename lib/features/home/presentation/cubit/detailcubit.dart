import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/features/domain/entity/forecastentetity.dart';
import 'package:weatherapp/features/domain/usecase/getforecast.dart';

import 'package:weatherapp/features/home/data/model/forecastrequest.dart';


class DetailCubit extends Cubit<DetailState> {
  final   Getforecast getForecast;

  DetailCubit(this.getForecast)
      : super(
          const DetailState(
            statuses: {
              'forecast': Status.initial,
            },
          ),
        );

  Future<void> loadForecast({
    required String city,
  }) async {
    emit(
      state.copyWith(
        statuses: {
          ...state.statuses,
          'forecast': Status.loading,
        },
      ),
    );

    try {
      final request = Forecastrequest(
        city: city,
        units: 'metric',
      );

      final forecast = await getForecast(request);

      emit(
        state.copyWith(
          forecast: forecast,
          statuses: {
            ...state.statuses,
            'forecast': Status.success,
          },
        ),
      );
    } catch (e) {
      print('FORECAST ERROR:$e');
      emit(
        state.copyWith(
          statuses: {
            ...state.statuses,
            'forecast': Status.error,
          },
        ),
      );
    }
  }
}

class DetailState {
  final Forecastentetity? forecast;
  final Map<String, Status> statuses;

  const DetailState({
    this.forecast,
    required this.statuses,
  }); 

  DetailState copyWith({
   Forecastentetity? forecast,
    Map<String, Status>? statuses,
  }) {
    return DetailState(
      forecast: forecast ?? this.forecast,
      statuses: statuses ?? this.statuses,
    );
  }

  Status statusOf(String key) {
    return statuses[key] ?? Status.initial;
  }
}