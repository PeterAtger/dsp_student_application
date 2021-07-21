import 'package:dsp_student_application/Data/Repositories/authentication.dart';
import 'package:dsp_student_application/Logic/answered_questions/answeredquestions_cubit.dart';
import 'package:dsp_student_application/Logic/authentication/authentication_cubit.dart';
import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Logic/load_file/loadfile_cubit.dart';
import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Logic/profile_data/profile_data_cubit.dart';
import 'package:dsp_student_application/Logic/waiting_questions/cubit/waitingquestions_cubit.dart';
import 'package:dsp_student_application/Presentation/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'lib/Presentation/translations',
      fallbackLocale: Locale('ar'),
      child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavbarCubit>(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider<InternetconnectionCubit>(
            create: (context) => InternetconnectionCubit()),
        BlocProvider<LoadfileCubit>(create: (context) => LoadfileCubit()),
        BlocProvider<WaitingQuestionsCubit>(
            create: (context) => WaitingQuestionsCubit()),
        BlocProvider<AnsweredQuestionsCubit>(
            create: (context) => AnsweredQuestionsCubit()),
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider<ProfileDataCubit>(
          create: (BuildContext context) => ProfileDataCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Student Demo',
        theme: ThemeData(
          primarySwatch: AppColors.cGreen,
          accentColor: AppColors.cGreen,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'lato',
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: Tokens.signInToken == null ? '/' : '/MainScreen',
      ),
    );
  }
}
