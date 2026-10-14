import 'package:weatherapp/features/domain/entity/weatherentetity.dart';
import 'package:weatherapp/features/home/data/model/weather_requestmodel.dart';
import 'package:weatherapp/features/home/data/repository/home_repository.dart';

class Getcurrentweather {
  final HomeRepository repository;
  Getcurrentweather(this.repository);
  Future<Weatherentetity>call (WeatherRequestmodel request){
    return repository.getCurrentWeather(request);
  }

}