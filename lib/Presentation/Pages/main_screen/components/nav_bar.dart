// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:dsp_student_application/Presentation/Theme/theme.dart';

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   List<String> _widgetOptions = [
//     '/profile',
//     '/setting',
//     '/MainScreen',
//     '/profile',
//     '/profile',
//   ];
//   void _onItemTap(int index) {
//     setState(() {
//       Navigator.pushReplacementNamed(context, _widgetOptions[index]);
//       //(index==2)?Navigator.popUntil(context, ModalRoute.withName('/QuestionsList')):Navigator.pushNamed(context, _widgetOptions[index]);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ConvexAppBar(
//       style: TabStyle.fixedCircle,
//       height: 52,
//       gradient: LinearGradient(
//         stops: [0, 1],
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//         colors: [
//           AppColors.cPurple,
//           Color.fromARGB(255, 71, 86, 146),
//         ],
//       ),

//       items: [
//         TabItem(
//             icon: SvgPicture.asset(
//           'lib/Presentation/Images/user_outlined.svg',
//           color: AppColors.cLightGrey,
//           height: 24,
//         )),
//         TabItem(
//             icon: SvgPicture.asset(
//           'lib/Presentation/Images/setting.svg',
//           color: AppColors.cLightGrey,
//           height: 24,
//         )),
//         TabItem(
//             icon:
//                 Icon(Icons.home_rounded, color: AppColors.cDarkGrey, size: 32)),
//         TabItem(
//             icon: SvgPicture.asset(
//           'lib/Presentation/Images/question.svg',
//           color: AppColors.cLightGrey,
//           height: 24,
//         )),
//         TabItem(
//             icon: Icon(Icons.check_circle_outline_sharp,
//                 color: AppColors.cLightGrey, size: 24)),
//       ],
//       //initialActiveIndex: 0,
//       onTap: _onItemTap,
//     );
//   }
// }
