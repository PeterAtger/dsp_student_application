import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'notificationsettings_state.dart';

class NotificationSettingsCubit
    extends HydratedCubit<NotificationSettingsState> {
  NotificationSettingsCubit()
      : super(NotificationSettingsState(
            pushNotifications: true, newUpdates: true, answeredQuery: true));

  void togglePushNotifications(NotificationSettingsState state) {
    state.pushNotifications == true
        ? emit(NotificationSettingsState(
            pushNotifications: false, newUpdates: false, answeredQuery: false))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            answeredQuery: state.answeredQuery));
  }

  void toggleNewUpdates(NotificationSettingsState state) {
    state.newUpdates == true
        ? emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: false,
            answeredQuery: state.answeredQuery))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: true,
            answeredQuery: state.answeredQuery));
  }

  void toggleAnsweredQuery(NotificationSettingsState state) {
    state.answeredQuery == true
        ? emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            answeredQuery: false))
        : emit(NotificationSettingsState(
            pushNotifications: true,
            newUpdates: state.newUpdates,
            answeredQuery: true));
  }

  @override
  NotificationSettingsState fromJson(Map<String, dynamic> json) {
    return NotificationSettingsState(
        pushNotifications: json['pushNotifications'],
        answeredQuery: json['answeredQuery'],
        newUpdates: json['newUpdates']);
  }

  @override
  Map<String, dynamic> toJson(NotificationSettingsState state) {
    return {
      'pushNotifications': state.pushNotifications,
      'answeredQuery': state.answeredQuery,
      'newUpdates': state.newUpdates
    };
  }
}
