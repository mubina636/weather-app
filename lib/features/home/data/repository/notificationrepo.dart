import 'package:weatherapp/features/domain/entity/notificationentetity.dart';


import 'package:weatherapp/features/home/notification/model/notificationrequestmodel.dart';

abstract class Notificationrepo{
  Future<NotificaionEntetity> getNotification(Notificationrequestmodel request);
}
