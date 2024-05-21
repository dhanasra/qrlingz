import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/pages/home/bloc/home_bloc.dart';
import 'package:qrlingz_app/widgets/barcodes_list.dart';
import 'package:qrlingz_app/widgets/qrcodes_list.dart';

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
        if(state is HistoryFetched){
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(tabs: [
                  Tab(text: "QR Codes"),
                  Tab(text: "Barcodes")
                ]),
                Expanded(
                  child: TabBarView(children: [
                    QRCodesList(
                      qrdata: state.qrcodes, 
                      controller: controller, 
                      onOptionClick: onOptionClick
                    ),
                    BarcodesList(
                      barcodes: state.barcodes, 
                      controller: controller
                    )
                  ]),
                )
              ],
            ),
          );
        }else{
          return const SizedBox();
        }
      }
    );
  }
}