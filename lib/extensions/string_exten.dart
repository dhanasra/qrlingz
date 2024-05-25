import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension TextExtensions on String {

  ds(BuildContext context, {TextAlign? align, String? fontFamily}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.displaySmall!.copyWith(
      fontFamily: fontFamily
    )).tr();
  }

  hl(BuildContext context, {TextAlign? align, bool bold = false, Color? color}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontWeight: bold ? FontWeight.bold: null, color: color
    )).tr();
  }

  hm(BuildContext context, {TextAlign? align}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineMedium).tr();
  }
  
  hs(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.headlineSmall).tr();
  }

  tl(BuildContext context, {int? maxLines, Color? color}){
    return Text(this, maxLines: maxLines, style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: color
    )).tr();
  }

  ts(BuildContext context, {Color? color, TextAlign? align}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.titleSmall!.copyWith(
      color: color
    )).tr();
  }

  bs(BuildContext context, {Color? color, TextAlign? align, bool elipsis = false}){
    return Text(this, textAlign: align ?? TextAlign.center, overflow: elipsis ? TextOverflow.ellipsis: null, 
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: color
    )).tr();
  }

  ls(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall!.copyWith(
      color: color
    )).tr();
  }

  lxs(BuildContext context, {Color? color}){
    return Text(this, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall!.copyWith(
      color: color,
      fontWeight: FontWeight.w300
    )).tr();
  }

}

extension ControllerExtension on TextEditingController {

  String trim(){
    return text.trim();
  }

}