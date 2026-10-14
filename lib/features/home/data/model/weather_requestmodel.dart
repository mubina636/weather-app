class WeatherRequestmodel {
  final String city;
  final String units;

  WeatherRequestmodel({
    required this.city,
    required this.units
  });
  Map<String, dynamic> toJson(){
  return{
 'q':city,
 'units':units,
  };
}
}
