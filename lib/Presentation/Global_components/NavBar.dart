import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiffNavBar extends StatefulWidget {
  @override
  _DiffNavBarState createState() => _DiffNavBarState();
}

class _DiffNavBarState extends State<DiffNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  AppColors.cPurple,
                  Color.fromARGB(255, 71, 86, 146),
                ])),
            height: 56,
          ),
          Container(
            height: 56,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/user.svg',
                    height: 24,
                    color: AppColors.cWhite,
                  ),
                ),
                SvgPicture.asset(
                  'lib/Presentation/Images/settings.svg',
                  height: 24,
                  color: AppColors.cWhite,
                ),
                Text(''),
                SvgPicture.asset(
                  'lib/Presentation/Images/question.svg',
                  height: 24,
                  color: AppColors.cWhite,
                ),
                SvgPicture.asset(
                  'lib/Presentation/Images/check.svg',
                  height: 24,
                  color: AppColors.cWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cWhite, width: 8),
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        elevation: 0,
        focusColor: AppColors.cGreen,
        child: Icon(
          Icons.home_filled,
        ),
        onPressed: () {},
      ),
    );
  }
}
