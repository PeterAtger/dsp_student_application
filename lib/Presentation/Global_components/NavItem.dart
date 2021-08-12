import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final NavBarState state;
  final SelectedPage itemState;
  final String iconText;
  final Function fn;

  const NavItem({
    Key key,
    this.state,
    this.itemState,
    this.iconText,
    @required this.fn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: state.selectedPage != this.itemState ? this.fn : () {},
      icon: SvgPicture.asset(
        state.selectedPage == this.itemState
            ? 'lib/Presentation/Images/${this.iconText}_filled.svg'
            : 'lib/Presentation/Images/${this.iconText}.svg',
        height: 24,
        color: state.selectedPage == this.itemState
            ? AppColors.cGreen
            : AppColors.cWhite,
      ),
    );
  }
}
