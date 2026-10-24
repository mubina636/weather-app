import 'package:weatherapp/core/network/apiclient.dart';
import 'package:weatherapp/features/home/notification/model/notificationrequestmodel.dart';
import 'package:weatherapp/features/home/notification/model/notificationresponcemodel.dart';

class NotificationDatasource {
  final ApiClient apiClient;

  NotificationDatasource(this.apiClient);

  Future<Notificationresponcemodel> getNotification(
    Notificationrequestmodel request,
  ) async {
    final response = await apiClient.dio.get(
      '/weather',
      queryParameters: request.toJson(),
    );

    print('NOTIFICATION RESPONSE: ${response.data}');

    return Notificationresponcemodel.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}