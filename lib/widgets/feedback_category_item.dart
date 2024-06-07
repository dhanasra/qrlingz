import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/utils/utils.dart';

class FeedbackCategoryItem extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback onDelete;
  final ValueChanged onIconAdd;
  const FeedbackCategoryItem({super.key, required this.controller, this.icon, required this.onDelete, required this.onIconAdd});


  openIconSheet(BuildContext context){

    var icons = getFeedbackIcons();

    showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return Container(
          color: context.theme().cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: "Add Icon".hm(context),  
              ),
              const Divider(),
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5
                  ), 
                  children: [
                    ...icons.keys.map(
                      (e) => IconButton(
                        onPressed: (){
                          onIconAdd(e);
                          context.back();
                        }, 
                        icon: Icon(icons[e]))
                      )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1)
      ),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: context.theme().inputDecorationTheme.fillColor,
              border: Border.all(
                color: context.theme().inputDecorationTheme.enabledBorder!.borderSide.color,
              ),
              borderRadius: BorderRadius.circular(4)
            ),  
            child: Row(
              children: [
                InkWell(
                  onTap: ()=>openIconSheet(context),
                  child: icon !=null 
                  ? Icon(icon) 
                  : const SizedBox(
                    width: 24, 
                    height: 24,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_outlined, size: 16,)
              ],
            )),
          
          8.w(),

          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter category name",
                suffixIcon: IconButton(
                  onPressed: ()=>onDelete(), 
                  icon: const Icon(Icons.delete_outline_outlined)
                ),
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}