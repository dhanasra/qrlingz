import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlingz_app/constants/assets_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/widgets/favourite_item.dart';

import '../bloc/home_bloc.dart';

class FavouritesFragment extends StatelessWidget {
  const FavouritesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state is HistoryLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ValueListenableBuilder(
          valueListenable: Global.favourites,
          builder: (_, value, __) {

            if(value.isEmpty){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetsConst.empty, width: 300),
                  16.h(),
                  "No Favourites Found".hm(context),
                  8.h(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 250
                    ),
                    child: "Save Your Favourite QRCodes Here For Easy Access".ts(
                      context, align: TextAlign.center, color: Colors.grey),  
                  )
                ],
              );
            }

            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ...value.map((e) => FavouriteItem(item: e))
              ],
            );
          }
        );
      },
    );
  }
}
