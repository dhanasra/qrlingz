import 'package:flutter/material.dart';

class DataConst {

  DataConst._();

  static List<Map> sampleData = [
    {
      'type': 0, 
      'name': "Text", 
      'data': { 'value': "My Test" }, 
      'isFavourite': false, 
      'created': 1482223122760
    },
    {
      'type': 0, 
      'name': "Instagram", 
      'data': { 'value': "My Test" }, 
      'isFavourite': false, 
      'created': 1482223122760
    }
  ];

  static const Map<String, List> qrItems = {
    "STANDARD": [
      {
        "icon": Icons.text_fields_outlined,
        "text": "Text"
      },
      {
        "icon": Icons.link_outlined,
        "text": "Website"
      },
      {
        "icon": Icons.wifi_outlined,
        "text": "Wifi"
      },
      {
        "icon": Icons.contacts_outlined,
        "text": "Contact"
      },
      {
        "icon": Icons.phone_outlined,
        "text": "Phone"
      },
      {
        "icon": Icons.mail_outlined,
        "text": "Email"
      },
      {
        "icon": Icons.sms_outlined,
        "text": "SMS"
      },
      {
        "icon": Icons.event_outlined,
        "text": "Event"
      },
      {
        "icon": Icons.quick_contacts_mail_outlined,
        "text": "VCard"
      }
    ],
    "SOCIAL": [
      {
        "image": "res/images/facebook.png",
        "text": "Facebook"
      },
      {
        "image": "res/images/instagram.png",
        "text": "Instagram"
      },
      {
        "image": "res/images/whatsapp.png",
        "text": "Whatsapp"
      },
      {
        "image": "res/images/x.png",
        "text": "X"
      },
      {
        "image": "res/images/youtube.png",
        "text": "Youtube"
      },
      {
        "image": "res/images/spotify.png",
        "text": "Spotify"
      },
      {
        "image": "res/images/tiktok.png",
        "text": "TikTok"
      },
      {
        "image": "res/images/snapchat.png",
        "text": "Snapchat"
      },
      {
        "image": "res/images/viber.png",
        "text": "Viber"
      },
      {
        "image": "res/images/linkedin.png",
        "text": "Linkedin"
      },
      {
        "image": "res/images/paypal.png",
        "text": "Paypal"
      },
      {
        "image": "res/images/crypto.png",
        "text": "Crypto"
      },
      {
        "image": "res/images/pinterest.png",
        "text": "Pinterest"
      },
      {
        "image": "res/images/line.png",
        "text": "Line"
      },
      {
        "image": "res/images/wechat.png",
        "text": "Wechat"
      }
    ] 
  };

}