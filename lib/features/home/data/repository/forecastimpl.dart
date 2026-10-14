import 'package:weatherapp/features/domain/entity/forecastentetity.dart';
import 'package:weatherapp/features/home/data/datasource/datasource.dart';

import 'package:weatherapp/features/home/data/model/forecastrequest.dart';
import 'package:weatherapp/features/home/data/repository/forecastrepo.dart';


class ForecastRepositoryImpl implements Forecastrepo {
  final Datasource datasource;

  ForecastRepositoryImpl(this.datasource);

  @override
  Future<Forecastentetity> getForecast(
    Forecastrequest request,
  ) async {
    final response = await datasource.getForecast(request);

    return  Forecastentetity(
      items: response.items
          .map(
            (item) => ForecastItemEntity(
              dateTime: item.dateTime,
              temp: item.temp,
              main: item.main,
            ),
          )
          .toList(),
    );
  }
}