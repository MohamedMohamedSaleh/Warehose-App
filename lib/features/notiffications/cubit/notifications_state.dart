part of 'notifications_cubit.dart';

sealed class NotificationsStates {}

final class NotificationsInitial extends NotificationsStates {}

final class GetNotificationSuccessState extends NotificationsStates {}

final class OpenedNotificationSuccessState extends NotificationsStates {}

final class DeleteNotificationSuccessState extends NotificationsStates {}

final class DeleteNotificationLoadingsState extends NotificationsStates {
  final int index;

  DeleteNotificationLoadingsState({required this.index});
}
