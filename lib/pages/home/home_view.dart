import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/constants/string_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/pages/home/cubit/home_cubit.dart';
import 'package:qrlingz_app/pages/home/home_viewmodel.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/drawer_dialog.dart';
import 'package:qrlingz_app/widgets/home_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit, int>(
      builder: (_, idx) {

        return Scaffold(
          key: _viewModel.key,
          endDrawer: const DrawerDialog(
            child: HomeDrawer()),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              idx==0 ? "QRLingz" 
              : idx==1 ? StringConst.favourites
              : StringConst.history).tr(),
            centerTitle: false,
            actions: [
              IconButton(onPressed: (){
                _viewModel.key.currentState?.openEndDrawer();
              }, icon: const Icon(Icons.menu)),
              8.w()
            ],
          ),
          body: PageView.builder(
            controller: _viewModel.controller,
            itemCount: _viewModel.items.length,
            itemBuilder: (_, idx)=>_viewModel.items[idx]
          ),
          bottomNavigationBar: Stack(
            alignment: Alignment.center,
            children: [
              BottomNavigationBar(
                currentIndex: idx,
                onTap: (idx)=>_viewModel.handleItemClick(context, idx),
                items: _viewModel.bottomNavItems.map(
                  (e) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(e.values.firstOrNull)  
                    ),
                    label: e.keys.firstOrNull
                  )
                ).toList()
              ),
              CircleAvatar(
                radius: 24,
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const RadialGradient(
                      stops: [0.7, 0.9],
                      colors: [
                      Color(0xFF0D0823), Color(0xFFACA4FE), 
                    ])
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
                    onPressed: ()=>context.goto(Routes.scan))
                  )
              ),
            ],
          ),
        );
      }
    );
  }
}