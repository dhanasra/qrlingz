import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlingz_app/constants/string_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/home/bloc/home_bloc.dart';
import 'package:qrlingz_app/widgets/history_item.dart';

import '../../../constants/assets_const.dart';
import '../../../widgets/styled_button.dart';

class HistoryFragment extends StatelessWidget {
  final PageController controller;
  final ValueChanged onOptionClick;
  const HistoryFragment({super.key, required this.controller, required this.onOptionClick});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if(state is HistoryLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is HistoryFetched && state.data.isEmpty){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsConst.notfound, width: 300),
              24.h(),
              StringConst.noHistoryTitle.hm(context),
              8.h(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 250
                ),
                child: StringConst.noHistorySub.ts(
                  context, align: TextAlign.center, color: Colors.grey),  
              ),
              32.h(),
              StyledButton(
                w: 160,
                rounded: true,
                onClick: ()=>controller.jumpTo(0),
                text: StringConst.create,
              )
            ],
          );
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children:  [
            ...(state is HistoryFetched ? state.data : []).map(
              (e) => HistoryItem(item: e, onOptionClick: onOptionClick))
          ],
        );
      }
    );
  }
}