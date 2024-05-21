import 'package:flutter/material.dart';

class StyledWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? m;
  final EdgeInsets? p;
  final Gradient? g;
  final double? r;
  final Border? border;
  const StyledWrapper({super.key, required this.child, this.m, this.p, this.g, this.r, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: m,
      padding: p,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(r ?? 8),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10),
          BoxShadow(offset: const Offset(3, 3), color: Theme.of(context).shadowColor, blurRadius: 10)
        ],
        gradient: g
      ),
      child: child
    );
  }
}