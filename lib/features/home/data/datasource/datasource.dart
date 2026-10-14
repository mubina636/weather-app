import 'package:weatherapp/core/network/apiclient.dart';
import 'package:weatherapp/features/home/data/model/forecastrequest.dart';
import 'package:weatherapp/features/home/data/model/forecastresponce.dart';
import 'package:weatherapp/features/home/data/model/weather_requestmodel.dart';
import 'package:weatherapp/features/home/data/model/weather_responsemodel.dart';


class Datasource {
  final ApiClient apiClient;

  Datasource(this.apiClient);

  Future<WeatherResponsemodel> getCurrentWeather(
    WeatherRequestmodel request,
  ) async {
    final response = await apiClient.dio.get(
      '/weather',
      queryParameters: request.toJson(),
    );

    return WeatherResponsemodel.fromJson(response.data);
  }

  Future<ForecastResponsemodel> getForecast(
     Forecastrequest request,
  ) async {
    final response = await apiClient.dio.get(
      '/forecast',
      queryParameters: request.toJson(),
    );

    return ForecastResponsemodel.fromJson(response.data);
  }
}