import 'package:weatherapp/features/domain/entity/weatherentetity.dart';
import 'package:weatherapp/features/home/data/datasource/datasource.dart';
import 'package:weatherapp/features/home/data/model/weather_requestmodel.dart';
import 'package:weatherapp/features/home/data/repository/home_repository.dart';

class HomerepoImpl implements HomeRepository {
  final Datasource datasource;
  HomerepoImpl(this.datasource);
  @override
  Future<Weatherentetity>getCurrentWeather(
    WeatherRequestmodel request,
  )async{
    final responce=await datasource.getCurrentWeather(request);
    return Weatherentetity( speed:responce.speed,main: responce.main,temp: responce.temp, humidity: responce.humidity);}
}