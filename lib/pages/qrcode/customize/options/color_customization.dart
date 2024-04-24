import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:qrlingz_app/widgets/color_picker.dart';
import 'package:qrlingz_app/widgets/gradient_picker.dart';

import '../customize_viewmodel.dart';

class ColorCustomization extends StatelessWidget {
  final CustomizeViewModel vm;
  const ColorCustomization({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    vm.fg = vm.tempData.value.color?["fg"];

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: "Foreground"),
              Tab(text: "Background")
            ]
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Color".tl(context),
                      12.h(),
                      ColorPicker(
                        value: stringToColor(vm.fg),
                        onChanged: (v){
                          vm.fg = colorToString(v);
                          vm.fgg = null;
                          update();
                        }),
                      20.h(),
                      "Gradient".tl(context),
                      12.h(),
                      GradientPicker(
                        value: vm.fgg,
                        onChanged: (v){
                          vm.fgg = v;
                          vm.fg = null;
                          update();
                        }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Color".tl(context),
                      12.h(),
                      ColorPicker(
                        value: stringToColor(vm.bg),
                        onChanged: (v){
                          vm.bg = colorToString(v);
                          vm.bgg = null;
                          update();
                        }),
                      20.h(),
                      "Gradient".tl(context),
                      12.h(),
                      GradientPicker(
                        value: vm.bgg,
                        onChanged: (v){
                          vm.bgg = v;
                          vm.bg = null;
                          update();
                        }),
                    ],
                  ),
                )
              ]),
          )
        ],
      ),
    );
  }

  update(){
    vm.tempData.value = vm.tempData.value.copyWith(
      color: {
        "fg": vm.fg,
        "fgg": vm.fgg,
        "bg": vm.bg,
        "bgg": vm.bgg
      });
  }
}