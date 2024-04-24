import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_viewmodel.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class LogoCustomization extends StatelessWidget {
  final CustomizeViewModel vm;
  const LogoCustomization({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    var items = Global.logos;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ValueListenableBuilder(
          valueListenable: vm.tempData,
          builder: (_, value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton(
                  w: 140,
                  onClick: (){}, 
                  text: "Pick Image"
                ),
                if(value.logo!=null)
                16.w(),
                if(value.logo!=null)
                StyledButton(
                  w: 140,
                  outlined: true,
                  onClick: (){
                    vm.tempData.value = vm.tempData.value.copyWith(logo: null);
                  }, 
                  text: "Remove"
                )
              ],
            );
          }
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
              onTap: (){
                vm.tempData.value = vm.tempData.value.copyWith(logo: items[idx]);
              },
              child: Image.network(items[idx], width: 50));
          })
      ],
    );
  }
}