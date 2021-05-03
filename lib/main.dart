import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: MaterialApp(
        title: 'Student Demo',
        theme: ThemeData(
          primarySwatch: AppColors.cPurple,
          accentColor: AppColors.cGreen,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'lato',
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
