import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/color_picker.dart';
import 'package:qrlingz_app/widgets/gradient_picker.dart';

class ColorCustomization extends StatelessWidget {
  const ColorCustomization({super.key});

  @override
  Widget build(BuildContext context) {

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
                      ColorPicker(onChanged: (v){}),
                      20.h(),
                      "Gradient".tl(context),
                      12.h(),
                      GradientPicker(onChanged: (v){}),
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
                      ColorPicker(onChanged: (v){}),
                      20.h(),
                      "Gradient".tl(context),
                      12.h(),
                      GradientPicker(onChanged: (v){}),
                    ],
                  ),
                )
              ]),
          )
        ],
      ),
    );
  }
}