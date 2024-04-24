import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/data_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_viewmodel.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class LogoCustomization extends StatelessWidget {
  final CustomizeViewModel vm;
  const LogoCustomization({super.key, required this.vm});

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
            return InkWell(
              onTap: ()=>{},
              child: Image.asset(items[idx], width: 50));
          })
      ],
    );
  }
}