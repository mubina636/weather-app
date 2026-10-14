import 'package:weatherapp/features/domain/entity/notificationentetity.dart';
import 'package:weatherapp/features/home/data/datasource/notificationdatasource.dart';
import 'package:weatherapp/features/home/data/repository/notificationrepo.dart';
import 'package:weatherapp/features/home/notification/model/notificationrequestmodel.dart';
 
 
 
class NotificationRepositoryImpl implements Notificationrepo {
  final NotificationDatasource datasource;

  NotificationRepositoryImpl(this.datasource);

  @override
  Future<NotificaionEntetity> getNotification(
   Notificationrequestmodel request,
  ) async {
    final response = await datasource.getNotification(request);
    return NotificaionEntetity(temp: response.temp, humidity: response.humidity, main:response.main, speed: response.speed);
  }
}