import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';

class FeedbackCategoryItem extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback onDelete;
  const FeedbackCategoryItem({super.key, required this.controller, this.icon, required this.onDelete});

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
                icon !=null 
                  ? Icon(icon) 
                  : const SizedBox(
                    width: 24, 
                    height: 24,
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