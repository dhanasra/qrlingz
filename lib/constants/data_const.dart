import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataConst {

  DataConst._();

  static List<String> logoImages = [
    "res/images/facebook.png",
    "res/images/instagram.png",
    "res/images/x.png",
    "res/images/tiktok.png",
    "res/images/snapchat.png",
    "res/images/wechat.png",
    "res/images/line.png",
    "res/images/whatsapp.png",
    "res/images/viber.png",
    "res/images/pinterest.png",
    "res/images/spotify.png",
    "res/images/crypto.png",
    "res/images/linkedin.png",
    "res/images/paypal.png",
    "res/images/youtube.png",
  ];

  static List<Map> sampleData = [
    {
      'id': "1",
      'type': 0, 
      'name': "Text", 
      'data': { 'value': "My Test" }, 
      'isFavourite': false, 
      'created': 1482223122760
    },
    {
      'id': "2",
      'type': 1, 
      'name': "Instagram", 
      'data': { 'value': "My Test" }, 
      'isFavourite': false, 
      'created': 1482223122760
    }
  ];

  static List fontFamilies = [
    {
      "name": "Default",
      "style": GoogleFonts.lato(),
      "size": 16.0
    },
    {
      "name": "Styled",
      "style": GoogleFonts.dancingScript(),
      "size": 18.0
    },
    {
      "name": "Anton",
      "style": GoogleFonts.anton(),
      "size": 16.0
    },
    {
      "name": "Lugrasimo",
      "style": GoogleFonts.lugrasimo(),
      "size": 14.0
    },
    {
      "name": "Pacifico",
      "style": GoogleFonts.pacifico(),
      "size": 16.0
    },
    {
      "name": "Caveat",
      "style": GoogleFonts.caveat(),
      "size": 24.0
    }
  ];

  static const List barcodeItems = [
      {
        "id": "codabar",
        "text": "CODABAR"
      },
      {
        "id": "code_39",
        "text": "Code 39"
      },
      {
        "id": "code_93",
        "text": "Code 93"
      },
      {
        "id": "code_128",
        "text": "Code 128"
      },
      {
        "id": "gs1_128",
        "text": "GS1-128"
      },
      {
        "id": "itf",
        "text": "Interleaved 2 of 5 (ITF)"
      },
      {
        "id": "itf_14",
        "text": "ITF-14"
      },
      {
        "id": "itf_16",
        "text": "ITF-16"
      },
      {
        "id": "ean_13",
        "text": "EAN 13"
      },
      {
        "id": "ean_8",
        "text": "EAN 8"
      },
      {
        "id": "ean_2",
        "text": "EAN 2"
      },
      {
        "id": "ean_5",
        "text": "EAN 5"
      },
      {
        "id": "isbn",
        "text": "ISBN"
      },
      {
        "id": "upc_a",
        "text": "UPC-A"
      },
      {
        "id": "upc_e",
        "text": "UPC-E"
      },
      {
        "id": "telepen",
        "text": "Telepen"
      },
      {
        "id": "rm4scc",
        "text": "RM4SCC"
      },
      {
        "id": "pdf417",
        "text": "PDF417"
      },
      {
        "id": "data_matrix",
        "text": "Data Matrix"
      },
      {
        "id": "aztec",
        "text": "Aztec"
      },
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
    "DYNAMIC": [
      {
        "icon": Icons.insert_drive_file_outlined,
        "text": "File"
      },
      {
        "icon": Icons.image_outlined,
        "text": "Picture"
      },
      {
        "icon": Icons.videocam_outlined,
        "text": "Video"
      },
      {
        "icon": Icons.audio_file_outlined,
        "text": "Audio"
      },
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

  static const List dynamics = ["File", "Picture", "Video", "Audio"];

}