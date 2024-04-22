import 'package:flutter/material.dart';

extension TextExtensions on String {

  tl(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.titleLarge);
  }

  ts(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.titleSmall);
  }

  bs(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: color
    ));
  }

  ls(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall!.copyWith(
      color: color
    ));
  }

}