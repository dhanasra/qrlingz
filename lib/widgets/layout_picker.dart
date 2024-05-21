import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';

class LayoutPicker extends StatefulWidget {
  final String? type;
  final ValueChanged onChanged;
  const LayoutPicker({super.key, this.type, required this.onChanged});

  @override
  State<LayoutPicker> createState() => _LayoutPickerState();
}

class _LayoutPickerState extends State<LayoutPicker> {
  String? selected;

  @override
  void initState() {
    selected = widget.type;
    super.initState();
  }

  update(String type){
    setState(()=>selected=type);
    widget.onChanged(type);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: (context.sh()/context.sw())
      ), 
      children: [
        InkWell(
          onTap: ()=>update("layout1"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout1" ? 3 : 1,
                  color: selected=="layout1" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 50,
                        color: Colors.white,
                      ),
                      8.h(),
                      Container(
                        height: 50,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
        ),
        InkWell(
          onTap: ()=>update("layout2"),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: selected=="layout2" ? 3 : 1,
                  color: selected=="layout2" ? context.theme().primaryColor : Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        color: Colors.white,
                      ),
                      8.h(),
                      Container(
                        height: 16,
                        width: 50,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
        )
      ]);
  }
}