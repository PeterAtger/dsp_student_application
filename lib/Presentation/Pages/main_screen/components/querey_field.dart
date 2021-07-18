import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/create_text_field.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/main_screen.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class QueryField extends StatelessWidget {
  const QueryField({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GradientOutline(
      size: size,
      radius: 32,
      chld: Column(
        children: [
          BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
            builder: (context, state) {
              return TextFieldCreation(
                  size: size,
                  text: state.isConnected
                      ? LocaleKeys.write_new_query.tr()
                      : "No internet coneection",
                  maximumLines: (size.height * 0.3 / 22).floor(),
                  border: false);
            },
          ),
          UrgantBar(),
        ],
      ),
    );
  }
}
