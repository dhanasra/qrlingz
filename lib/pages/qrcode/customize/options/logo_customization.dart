import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qrlingz_app/constants/data_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class LogoCustomization extends StatelessWidget {
  const LogoCustomization({super.key});

  @override
  Widget build(BuildContext context) {

    var items = DataConst.logoImages;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Align(
          alignment: Alignment.center,
          child: StyledButton(
            w: 160,
            onClick: (){}, 
            text: "Pick Image"
          ),
        ),
        16.h(),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1
          ), 
          itemBuilder: (_, idx){
            return Image.asset(items[idx], width: 50);
          })
      ],
    );
  }
}