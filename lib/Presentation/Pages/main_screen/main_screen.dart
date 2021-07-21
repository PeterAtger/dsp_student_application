import 'package:dsp_student_application/Logic/search/search_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/querey_field.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/search_bar.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/upload_file.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/Global_components/ArabicImage.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: ScreenBody(),
    );
  }
}

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    TextEditingController _textController = TextEditingController();
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    return Container(
      child: Stack(alignment: Alignment.bottomCenter, children: [
        //Screen Backgroud
        ArabicImage(
          size: size.height / 1.5,
          top: -size.height / 3,
          right: -size.height / 3,
          blendMode: BlendMode.srcATop,
          opacity: 0.05,
        ),

        //Screen content
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(bottom: 72),
              height: size.height - 56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu bar
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 32,
                            color: AppColors.cDarkGrey,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(LocaleKeys.MainScreen.tr(),
                            style: AppFonts.heading5.copyWith(
                              color: AppColors.cDarkGrey,
                            )),
                      ],
                    ),
                  ),

                  BlocConsumer<SearchCubit, SearchState>(
                    listener: (context, state) {
                      state is SearchFlipperState ? print(state.isFlipped) : {};
                      if (state is SearchFlipperState && state.isFlipped == 1) {
                        cardKey.currentState.toggleCard();
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SearchBar(
                                size: size,
                                controller: _textController
                                  ..addListener(() {
                                    if (cardKey.currentState.isFront ||
                                        _textController.text == '')
                                      context.read<SearchCubit>().flipper(1);
                                    context
                                        .read<SearchCubit>()
                                        .getSearchResults(_textController.text);
                                  }),
                              ),
                              SizedBox(height: 32),
                              // FLip Search and Write
                              Expanded(
                                child: Container(
                                  child: FlipCard(
                                    key: cardKey,
                                    flipOnTouch: false,
                                    front: QueryField(size: size),
                                    back: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: AppColors.cGreen),
                                        borderRadius: BorderRadius.circular(32),
                                        // color: AppColors.cLightGrey,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: state
                                                        is SearchResultsState &&
                                                    state.answers != []
                                                ? state.answers
                                                : [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Container())
                                                      ],
                                                    )
                                                  ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Everything else
                              SizedBox(height: 32),
                              UploadButton(size: size),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
