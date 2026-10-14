class Notificationresponcemodel {
  final double temp;
  final String  description;
  final int humidity;
  final String main;
  final double speed;

  Notificationresponcemodel({
    required this.description,
    required this.temp,
    required this.humidity,
    required this.main,
    required this.speed,
  });
  factory Notificationresponcemodel.fromJson(Map<String, dynamic> json) {
    return Notificationresponcemodel(
      description: (json['weather'[0]]['description']),
      temp: (json['main']['temp'] as num).toDouble(),
      speed: (json ['wind']['speed'] as num).toDouble(),
      humidity: (json['main']['humidity'] as int),
      main: (json['weather'][0]['main'] as String),
    );
  }
}
