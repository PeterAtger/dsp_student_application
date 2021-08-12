import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Logic/search/search_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsp_student_application/Presentation/Global_components/LightPageSnackBar.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    @required this.size,
    @required this.controller,
  }) : super(key: key);

  final Size size;
  final TextEditingController controller;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  GlobalKey<FlipCardState> iconKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
      builder: (context, internetState) {
        return BlocListener<SearchCubit, SearchState>(
          listener: (context, state) {
            state is SearchFlipperState ? print(state.isFlipped) : {};
            if (state is SearchFlipperState && state.isFlipped == 1) {
              iconKey.currentState.toggleCard();
            }
          },
          child: Container(
              height: 52,
              child: TextField(
                controller: this.widget.controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: AppColors.cDarkGrey)),
                  hintStyle: AppFonts.bodyText1,
                  hintText: LocaleKeys.search.tr(),
                  // Another flip Card
                  suffixIcon: FlipCard(
                      key: iconKey,
                      front: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 24,
                          color: AppColors.cDarkGrey,
                        ),
                        onPressed: () {
                          if (internetState.isConnected)
                            print(LocaleKeys.search.tr());
                          else
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                        },
                      ),
                      back: IconButton(
                          onPressed: () {
                            this.widget.controller.text = '';
                            context.read<SearchCubit>().flipper(1);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: AppColors.cDarkGrey,
                          ))),
                ),
              )),
        );
      },
    );
  }
}
