import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/pages/home/bloc/home_bloc.dart';
import 'package:qrlingz_app/widgets/history_item.dart';

class HistoryFragment extends StatelessWidget {
  const HistoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if(state is HistoryLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(20),
          children:  [
            ...(state is HistoryFetched ? state.data : []).map(
              (e) => HistoryItem(item: e))
          ],
        );
      }
    );
  }
}