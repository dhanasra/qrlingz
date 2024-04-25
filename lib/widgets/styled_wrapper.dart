import 'package:flutter/material.dart';

class StyledWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? m;
  final EdgeInsets? p;
  const StyledWrapper({super.key, required this.child, this.m, this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: m,
      padding: p,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10),
          BoxShadow(offset: const Offset(3, 3), color: Theme.of(context).shadowColor, blurRadius: 10)
        ]
      ),
      child: child
    );
  }
}