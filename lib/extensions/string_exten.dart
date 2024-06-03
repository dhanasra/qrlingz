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

  hls(BuildContext context, {TextAlign? align, bool bold = false, Color? color, bool elipsis = false}){
    return Text(this, textAlign: align, overflow: elipsis ? TextOverflow.ellipsis: null, 
    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontWeight: bold ? FontWeight.bold: null, color: color,
      fontSize: 26
    )).tr();
  }

  hm(BuildContext context, {TextAlign? align, Color? color}){
    return Text(this, textAlign: align, style: Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: color,
    )).tr();
  }
  
  hs(BuildContext context){
    return Text(this, style: Theme.of(context).textTheme.headlineSmall).tr();
  }

  tl(BuildContext context, {int? maxLines, TextAlign? align, Color? color}){
    return Text(this, textAlign: align, maxLines: maxLines, style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: color
    )).tr();
  }

  tm(BuildContext context, {int? maxLines, TextAlign? align, Color? color}){
    return Text(this, textAlign: align, maxLines: maxLines, style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: color,
      fontSize: 15
    )).tr();
  }

  ts(BuildContext context, {Color? color, TextAlign? align, bool elipsis = false}){
    return Text(this, textAlign: align, overflow: elipsis ? TextOverflow.ellipsis: null, 
    style: Theme.of(context).textTheme.titleSmall!.copyWith(
      color: color
    )).tr();
  }

  bs(BuildContext context, {Color? color, TextAlign? align, bool elipsis = false, bool bold = true}){
    return Text(this, textAlign: align ?? TextAlign.center, overflow: elipsis ? TextOverflow.ellipsis: null, 
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: color,
      fontWeight: bold ? null :FontWeight.w500
    )).tr();
  }

  ls(BuildContext context, {Color? color, bool bold = false, }){
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