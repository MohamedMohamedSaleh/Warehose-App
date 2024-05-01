import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/features/notiffications/model.dart';

import '../../../core/logic/helper_mothods.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(NotificationsInitial());

  List<NotificationData> noti = CacheHelper.getNotifications() ?? [];
  bool isOpen = true;
  int numNoti = 0;

  void openedNoti() {
    isOpen = true;
    numNoti = 0;
    emit(OpenedNotificationSuccessState());
  }

  void addNoti({required String title, required String body}) {
    noti.add(NotificationData(title: title, body: body));
    CacheHelper.setNotification(noti);
    isOpen = false;
    numNoti++;
    emit(GetNotificationSuccessState());
  }

  void getNoti() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          showMessage(
            isAction: true,
            message: message.notification!.title!,
            type: MessageType.success,
          );
          addNoti(
              title: message.notification!.title!,
              body: message.notification!.body!);
          emit(GetNotificationSuccessState());
        }
      },
    );
  }

  Future<void> deleteNoti({required int index}) async {
    emit(DeleteNotificationLoadingsState(index: index));
    await Future.delayed(
      const Duration(seconds: 1),
    );
    noti.removeAt(index);
    CacheHelper.setNotification(noti);
    emit(DeleteNotificationSuccessState());
  }
}
