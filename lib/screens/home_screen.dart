import '../bloc/bloc/cat_bloc.dart';
import '../widgets/reset_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';
import '../widgets/cat_card_reborn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientColor1,
              gradientColor2,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: BlocBuilder<CatBloc, CatState>(builder: (context, state) {
          if (state is CatLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                CatCardReborn(
                  isLoading: true,
                  isLocal: true,
                  catPic: placeholder,
                ),
                Spacer(),
                ResetButton(
                  isActive: false,
                ),
                Spacer(),
              ],
            );
          }
          if (state is CatLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CatCardReborn(
                  isLoading: false,
                  isLocal: false,
                  catFact: state.catFact,
                  catPic: state.catPic,
                ),
                const Spacer(),
                const ResetButton(
                  isActive: true,
                ),
                const Spacer(),
              ],
            );
          }
          if (state is CatFailedAPI) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                CatCardReborn(
                  isLoading: false,
                  isLocal: true,
                  catFact: "API call failed, check internet and try again :(",
                  catPic: placeholder,
                ),
                Spacer(),
                ResetButton(
                  isActive: true,
                ),
                Spacer(),
              ],
            );
          }

          return Container();
        }),
      ),
    );
  }
}
