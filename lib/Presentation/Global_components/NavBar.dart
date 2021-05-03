import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
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
                  InkWell(
                    onTap: () {
                      if (state.selectedPage != SelectedPage.profile) {
                        context.read<NavbarCubit>().goToProfile();
                      }
                    },
                    child: SvgPicture.asset(
                      state.selectedPage == SelectedPage.profile
                          ? 'lib/Presentation/Images/user_filled.svg'
                          : 'lib/Presentation/Images/user.svg',
                      height: 24,
                      color: state.selectedPage == SelectedPage.profile
                          ? AppColors.cGreen
                          : AppColors.cWhite,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (state.selectedPage != SelectedPage.settings) {
                        context.read<NavbarCubit>().goToSettings();
                      }
                    },
                    child: SvgPicture.asset(
                      state.selectedPage == SelectedPage.settings
                          ? 'lib/Presentation/Images/settings_filled.svg'
                          : 'lib/Presentation/Images/settings.svg',
                      height: 24,
                      color: state.selectedPage == SelectedPage.settings
                          ? AppColors.cGreen
                          : AppColors.cWhite,
                    ),
                  ),
                  Text(''),
                  InkWell(
                    onTap: () {
                      if (state.selectedPage != SelectedPage.savedQuestions) {
                        context.read<NavbarCubit>().goToSavedQuestions();
                      }
                    },
                    child: SvgPicture.asset(
                      state.selectedPage == SelectedPage.savedQuestions
                          ? 'lib/Presentation/Images/question_filled.svg'
                          : 'lib/Presentation/Images/question.svg',
                      height: 24,
                      color: state.selectedPage == SelectedPage.savedQuestions
                          ? AppColors.cGreen
                          : AppColors.cWhite,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (state.selectedPage !=
                          SelectedPage.answeredQuestions) {
                        context.read<NavbarCubit>().goToAnsweredQuestions();
                      }
                    },
                    child: SvgPicture.asset(
                      state.selectedPage == SelectedPage.answeredQuestions
                          ? 'lib/Presentation/Images/check.svg'
                          : 'lib/Presentation/Images/check.svg',
                      height: 24,
                      color:
                          state.selectedPage == SelectedPage.answeredQuestions
                              ? AppColors.cGreen
                              : AppColors.cWhite,
                    ),
                  ),
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
