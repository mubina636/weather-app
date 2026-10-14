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

  Future<void> loadNotification({required String city}) async {
    print('1. loadNotification started');

    emit(
      state.copyWith(
        statuses: {
          ...state.statuses,
          'notification': Status.loading,
        },
      ),
    );

    try {
      print('2. Request started');

      final request = Notificationrequestmodel(
        city: city,
        units: 'metric',
      );

      final notification = await getnotification(request);

      print('3. Request success');
      print('4. Before success emit');

      emit(
        state.copyWith(
          notification: notification,
          statuses: {
            ...state.statuses,
            'notification': Status.success,
          },
        ),
      );

      print('5. Success emitted');
      print('6. Current status: ${state.statusOf('notification')}');
    } catch (e, stackTrace) {
     
      print('9. STACKTRACE:');
      print(stackTrace);

      emit(
        state.copyWith(
          statuses: {
            ...state.statuses,
            'notification': Status.error,
          },
        ),
      );

      print('10. Error emitted');
      print('11. Current status: ${state.statusOf('notification')}');
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