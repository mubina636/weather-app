import 'package:weatherapp/features/home/notification/model/notificationrequestmodel.dart';
import 'package:weatherapp/features/domain/entity/notificationentetity.dart';
import 'package:weatherapp/features/home/data/repository/notificationrepo.dart';

class Getnotification {
  final Notificationrepo repository;

  Getnotification(this.repository);

  Future<NotificaionEntetity> call(
    Notificationrequestmodel request,
  ) {
    return repository.getNotification(request);
  }
}