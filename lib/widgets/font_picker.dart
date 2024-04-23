import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/color_const.dart';

import '../constants/data_const.dart';

class FontPicker extends StatelessWidget {
  final ValueChanged onChanged;
  const FontPicker({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Map?> picked = ValueNotifier(null);

    return ValueListenableBuilder(
      valueListenable: picked,
      builder: (_, val, __) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DataConst.fontFamilies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2
          ), 
          itemBuilder: (_, idx){
            bool isSelected = DataConst.fontFamilies[idx]["name"] == picked.value?["name"];
            return InkWell(
              onTap: (){
                picked.value = DataConst.fontFamilies[idx];
                onChanged(DataConst.fontFamilies[idx]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isSelected
                  ? ColorConst.primary
                  : Theme.of(context).colorScheme.tertiary,
                  boxShadow: const [
                    BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
                    BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
                  ]
                ),
                child: Text("${DataConst.fontFamilies[idx]["name"]}", 
                style: (DataConst.fontFamilies[idx]["style"] as TextStyle).copyWith(
                  fontSize: DataConst.fontFamilies[idx]["size"] as double,
                  color: isSelected ? Colors.white : Colors.black
                )),
              ),
            );
          });
      }
    );
  }
}