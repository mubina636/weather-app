class Notificationrequestmodel {
  final String city;
  final String units;

 Notificationrequestmodel({
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
