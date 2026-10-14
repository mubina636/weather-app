class Forecastentetity {
  final List<ForecastItemEntity> items;
  const Forecastentetity({
    required this.items
  });

}
class ForecastItemEntity{
  final DateTime dateTime;
  final double temp;
  final String main;
  const ForecastItemEntity({
    required this.dateTime,
     required this.temp,
     required this.main
  });
}