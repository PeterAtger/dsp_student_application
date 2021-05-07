import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/settings_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/main_screen.dart';
import 'package:dsp_student_application/Presentation/global_components/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _controller = PageController(initialPage: 3);
  List<Widget> _screens = [
    Profile(),
    Settings(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: DiffNavBar(),
        drawer: SideMenu(
          size: size,
        ),
        //Body
        body: BlocListener<NavbarCubit, NavBarState>(
          listener: (context, state) {
            print(state.selectedPage.index);
            _controller.animateToPage(state.selectedPage.index,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          },
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: _screens,
          ),
        ));
  }
}
