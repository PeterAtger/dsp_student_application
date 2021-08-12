import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsToggle extends StatelessWidget {
  const SettingsToggle({
    Key key,
    @required this.size,
    @required this.onChanged,
    this.active = true,
    this.spacing,
    this.toggleText,
  }) : super(key: key);

  final Size size;
  final double spacing;
  final String toggleText;
  final Function onChanged;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 32),
        Container(
          width: size.width - this.spacing,
          height: 48,
          child: SwitchListTile(
            title: Text(
              this.toggleText,
              style: AppFonts.heading6.copyWith(color: AppColors.cDarkGrey),
            ),
            value: active,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
