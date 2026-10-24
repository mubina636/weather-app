import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/features/domain/usecase/getnotification.dart';
import 'package:weatherapp/features/home/notification/model/notificationrequestmodel.dart';
import 'package:weatherapp/features/domain/entity/notificationentetity.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final Getnotification getnotification;

  NotificationCubit(this.getnotification)
      : super(
          NotificationState(
            statuses: {
              'notification': Status.initial,
            },
          ),
        );

  Future<void> loadNotification({
    required String city,
  }) async {
    print('1. loadNotification started');
    print('CITY: $city');

    emit(
      state.copyWith(
        statuses: {
          ...state.statuses,
          'notification': Status.loading,
        },
      ),
    );

    try {
      print('2. Creating notification request');

      final request = Notificationrequestmodel(
        city: city,
        units: 'metric',
      );

      print('3. Sending notification request');

      final notification = await getnotification(request);

      print('4. Notification request successful');
      print('5. Before success emit');

      emit(
        state.copyWith(
          notification: notification,
          statuses: {
            ...state.statuses,
            'notification': Status.success,
          },
        ),
      );

      print('6. Success emitted');
      print(
        '7. Current status: '
        '${state.statusOf('notification')}',
      );
    } catch (e, stackTrace) {
      print('========== NOTIFICATION ERROR ==========');
      print('ERROR TYPE: ${e.runtimeType}');
      print('ERROR MESSAGE: $e');
      print('STACKTRACE:');
      print(stackTrace);
      print('========================================');

      emit(
        state.copyWith(
          statuses: {
            ...state.statuses,
            'notification': Status.error,
          },
        ),
      );

      print('NOTIFICATION STATUS: ${state.statusOf('notification')}');
    }
  }
}

class NotificationState {
  final NotificaionEntetity? notification;
  final Map<String, Status> statuses;

  const NotificationState({
    this.notification,
    required this.statuses,
  });

  NotificationState copyWith({
    NotificaionEntetity? notification,
    Map<String, Status>? statuses,
  }) {
    return NotificationState(
      notification: notification ?? this.notification,
      statuses: statuses ?? this.statuses,
    );
  }

  Status statusOf(String key) {
    return statuses[key] ?? Status.initial;
  }
}