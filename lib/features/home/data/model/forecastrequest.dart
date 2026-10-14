class Forecastrequest {
  final String city;
  final String units;

  Forecastrequest({
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
