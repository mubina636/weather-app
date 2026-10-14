import 'package:weatherapp/core/status/status.dart';

Status statusof(
  Map <String,Status> statues,
  String key,

){
  return statues[key]??Status.initial;
}