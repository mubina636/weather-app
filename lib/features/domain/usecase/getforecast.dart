import 'package:weatherapp/features/domain/entity/forecastentetity.dart';
import 'package:weatherapp/features/home/data/model/forecastrequest.dart';

import 'package:weatherapp/features/home/data/repository/forecastrepo.dart';

class Getforecast {
  final Forecastrepo  repository;
  Getforecast(this.repository);
  Future<Forecastentetity>call(Forecastrequest request){
    return repository.getForecast(request);
  }
}