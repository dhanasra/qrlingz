  import 'package:flutter/material.dart';

String? colorToString(Color? color) {
    if(color==null){
      return null;
    }
    return 'Color(0x${color.value.toRadixString(16).padLeft(8, '0')})';
}

Color? stringToColor(String? colorString) {
  if(colorString==null){
    return null;
  }
  String hexString = colorString.substring(8, 16);
  int colorValue = int.parse(hexString, radix: 16);
  return Color(colorValue);
}

String getDataType(String scanData){

  // website check
  final RegExp urlRegex = RegExp(
      r'^(?:http:\/\/|https:\/\/)?(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+(?:\/\S*)?$',
  );
  var isUrl = urlRegex.hasMatch(scanData);
  if(isUrl){
    return "Website";
  }
  
  //phone check
  if(scanData.startsWith("tel")){
    return "Phone";
  }

  //mail check
  if(scanData.startsWith("mailto")){
     return "Email";
  }

  //wifi check
  if(scanData.startsWith("WIFI")){
    return "Wifi";
  }

  //contact card check
  if(scanData.contains("VCARD")){
    return "VCard";
  }

  // sms check
  if(scanData.startsWith("smsto")){
    return "SMS";
  }

  if(scanData.startsWith("https://www.instagram.com")){
    return "Instagram";
  }
  if(scanData.startsWith("https://twitter.com")){
    return "X";
  }
  if(scanData.startsWith("https://www.snapchat.com")){
    return "Snapchat";
  }
  if(scanData.startsWith("https://www.paypal.me")){
    return "Paypal";
  }
  if(scanData.startsWith("https://www.pinterest.com")){
    return "Pinterest";
  }

  if(scanData.startsWith("whatsapp:")){
    return "Whatsapp";
  }
  if(scanData.startsWith("viber:")){
    return "Viber";
  }

  if(scanData.startsWith("https://www.youtube.com/")){
    return "Youtube";
  }

  if(scanData.startsWith("spotify:")){
    return "Spotify";
  }

  return "Website";
}