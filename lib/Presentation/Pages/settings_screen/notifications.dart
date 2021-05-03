import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Logic/notification_settings/notificationsettings_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_student_application/Presentation/Global_components/NavBar.dart';
import 'package:dsp_student_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/SettingsToggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
        create: (context) => NotificationSettingsCubit(),
        child: Stack(
          children: [
            Positioned(
              right: -size.height / 3,
              top: -size.height / 3,
              child: Container(
                width: size.height / 1.5,
                height: size.height / 1.5,
                child: BlendMask(
                    blendMode: BlendMode.srcOver,
                    opacity: 0.1,
                    child: Image.asset(
                        'lib/Presentation/Images/ArabicCircle.png')),
              ),
            ),
            BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 72),
                    TitleBar(title: 'Notifications'),
                    SizedBox(height: 56),
                    SettingsToggle(
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .togglePushNotifications(state);
                      },
                      size: size,
                      spacing: 48,
                      toggleText: 'Push Notifications',
                      active: state.pushNotifications,
                    ),
                    SizedBox(height: 32),
                    GradientLine(size: size),
                    SizedBox(height: 8),
                    SettingsToggle(
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .toggleAnsweredQuery(state);
                      },
                      size: size,
                      toggleText: 'Answered Query',
                      spacing: 80,
                      active: state.answeredQuery,
                    ),
                    SizedBox(height: 8),
                    SettingsToggle(
                      onChanged: (value) {
                        context
                            .read<NotificationSettingsCubit>()
                            .toggleNewUpdates(state);
                      },
                      size: size,
                      toggleText: 'New Updates',
                      spacing: 80,
                      active: state.newUpdates,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
