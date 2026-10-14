class WeatherResponsemodel {
  final double temp;
  final int humidity;
  final String main;
  final double speed;

  WeatherResponsemodel({
    required this.temp,
    required this.humidity,
    required this.main,
    required this.speed,
  });
  factory WeatherResponsemodel.fromJson(Map<String, dynamic> json) {
    return WeatherResponsemodel(
      temp: (json['main']['temp'] as num).toDouble(),
      speed: (json ['wind']['speed'] as num).toDouble(),
      humidity: (json['main']['humidity'] as int),
      main: (json['weather'][0]['main'] as String),
    );
  }
}
