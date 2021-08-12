part of 'notificationsettings_cubit.dart';

@immutable
class NotificationSettingsState {
  final bool pushNotifications;
  final bool answeredQuery;
  final bool newUpdates;

  NotificationSettingsState(
      {this.pushNotifications, this.answeredQuery, this.newUpdates});
}
