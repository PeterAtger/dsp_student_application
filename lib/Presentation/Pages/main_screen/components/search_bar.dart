import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Logic/search/search_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsp_student_application/Presentation/Global_components/LightPageSnackBar.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
        builder: (context, state) {
          return Hero(
            tag: 'Search',
            child: Container(
              height: 52,
              child: TextField(
                onChanged: (value) {
                  if (value != null)
                    Navigator.of(context).pushNamed('/MainScreen/Search');
                  // context.read<SearchCubit>().getSearchResults(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: AppColors.cDarkGrey)),
                  hintStyle: AppFonts.bodyText1,
                  hintText: LocaleKeys.search.tr(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 24,
                      color: AppColors.cDarkGrey,
                    ),
                    onPressed: () {
                      if (state.isConnected)
                        print(LocaleKeys.search.tr());
                      else
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
