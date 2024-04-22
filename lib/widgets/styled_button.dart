import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final double? w;
  const StyledButton({super.key, required this.onClick, required this.text, this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2B275A),
              Color(0xFF5C55AB),
              Color(0xFF2B275A),
            ]
          )
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent),
          onPressed: onClick, 
          child: Text(text)
        )
    );
  }
}