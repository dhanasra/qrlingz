import 'package:flutter/material.dart';

extension TextExtensions on String {

  ts(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.titleSmall);
  }

}