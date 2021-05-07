import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/Global_components/NavItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// NAVBAR
class DiffNavBar extends StatefulWidget {
  @override
  _DiffNavBarState createState() => _DiffNavBarState();
}

class _DiffNavBarState extends State<DiffNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavBarState>(builder: (context, state) {
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
                    Color.fromARGB(255, 71, 86, 146)
                  ])),
              height: 56,
            ),
            Container(
              height: 56,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NavItem(
                      state: state,
                      itemState: SelectedPage.profile,
                      iconText: 'user',
                      fn: () {
                        context.read<NavbarCubit>().goToProfile();
                      }),
                  NavItem(
                      state: state,
                      itemState: SelectedPage.settings,
                      iconText: 'settings',
                      fn: () {
                        context.read<NavbarCubit>().goToSettings();
                      }),
                  SizedBox(
                    width: 48,
                  ),
                  NavItem(
                      state: state,
                      itemState: SelectedPage.savedQuestions,
                      iconText: 'question',
                      fn: () {
                        context.read<NavbarCubit>().goToSavedQuestions();
                      }),
                  NavItem(
                      state: state,
                      itemState: SelectedPage.answeredQuestions,
                      iconText: 'check',
                      fn: () {
                        context.read<NavbarCubit>().goToAnsweredQuestions();
                      }),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

// FAB
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
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(56)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1, 0.0),
              colors: [AppColors.cPurple, AppColors.cGreen],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: BorderRadius.all(Radius.circular(54)),
            ),
            child: BlocBuilder<NavbarCubit, NavBarState>(
              builder: (context, state) {
                return FloatingActionButton(
                  backgroundColor: AppColors.cWhite,
                  elevation: 0,
                  focusColor: AppColors.cWhite,
                  child: SvgPicture.asset(
                    state.selectedPage != SelectedPage.home
                        ? 'lib/Presentation/Images/home_outlined.svg'
                        : 'lib/Presentation/Images/home_colored.svg',
                    color: AppColors.cGreen,
                  ),
                  onPressed: () {
                    context.read<NavbarCubit>().goToHome();
                  },
                );
              },
            ),
          ),
        ));
  }
}
