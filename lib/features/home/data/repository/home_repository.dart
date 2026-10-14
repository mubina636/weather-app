import 'package:weatherapp/features/domain/entity/weatherentetity.dart';
import 'package:weatherapp/features/home/data/model/weather_requestmodel.dart';

abstract class HomeRepository {
  Future<Weatherentetity> getCurrentWeather(WeatherRequestmodel request);
}
