import 'package:flutter/material.dart';
import 'package:qrlingz_app/pages/home/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = HomeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _viewModel.controller,
        itemCount: _viewModel.items.length,
        itemBuilder: (_, idx)=>_viewModel.items[idx]
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
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
                onPressed: ()=>{})
              )
          ),
        ],
      ),
    );
  }
}