import 'package:weatherapp/features/domain/entity/forecastentetity.dart';
import 'package:weatherapp/features/home/data/model/forecastrequest.dart';

abstract class Forecastrepo {
  Future<Forecastentetity>getForecast(
    Forecastrequest request
  );
}
