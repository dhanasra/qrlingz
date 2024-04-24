import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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


        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ...(state is HistoryFetched 
              ? state.data.where((element) => element.isFavourite).toList() 
              : []
            ).map((e) => FavouriteItem(item: e))
          ],
        );
      },
    );
  }
}
