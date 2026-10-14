class ForecastResponsemodel {
  final List<ForecastItem> items;

  ForecastResponsemodel({
    required this.items,
  });

  factory ForecastResponsemodel.fromJson(Map<String, dynamic> json) {
    final list = json['list'] as List;

    return ForecastResponsemodel(
      items: list
          .map(
            (item) => ForecastItem.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

class ForecastItem {
  final DateTime dateTime;
  final double temp;
  final String main;

  ForecastItem({
    required this.dateTime,
    required this.temp,
    required this.main,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dateTime: DateTime.parse(json['dt_txt']),
      temp: (json['main']['temp'] as num).toDouble(),
      main: json['weather'][0]['main'] as String,
    );
  }
}