import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/network/models/configuration.dart';
import 'package:qrlingz_app/utils/utils.dart';

import '../constants/data_const.dart';

class QRData {
  final String id;
  final int type;
  final String name;
  final Map data;
  final String? logo;
  final Map? text;
  final Map? color;
  final Map? pixels;
  final bool isFavourite;
  final DateTime created;
  final IconData? icon;
  final String? image;
  final String linkId;
  final Configuration? configuration;

  QRData({
    required this.id,
    required this.type,
    required this.name,
    required this.data,
    required this.linkId,
    this.logo,
    this.text,
    this.color,
    this.pixels,
    this.isFavourite = false,
    required this.created,
    this.icon,
    this.image,
    this.configuration
  });


  QRData copyWith({
    String? id,
    int? type,
    String? name,
    Map? data,
    String? logo,
    Map? text,
    Map? color,
    Map? pixels,
    bool? isFavourite,
    DateTime? created,
    IconData? icon,
    String? image,
    String? linkId,
    Configuration? configuration
  }) {
    return QRData(
      id: id ?? this.id,
      linkId: linkId ?? this.linkId,
      type: type ?? this.type,
      name: name ?? this.name,
      data: data ?? this.data,
      logo: logo,
      text: text ?? this.text,
      color: color ?? this.color,
      pixels: pixels ?? this.pixels,
      isFavourite: isFavourite ?? this.isFavourite,
      created: created ?? this.created,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      configuration: configuration ?? this.configuration
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'data': data,
      'linkId': linkId,
      'logo': logo,
      'text': text,
      'color': color,
      'pixels': pixels,
      'isFavourite': isFavourite,
      'created': created.millisecondsSinceEpoch,
      'configuration': configuration?.toMap()
    };
  }

  factory QRData.fromMap(map) {

    Map<String, dynamic>? item;
    var searchText = map['name'];

    var qrItems = DataConst.qrItems;
    Map<String, dynamic>? standardItem = qrItems["STANDARD"]?.firstWhere((item) {
      return item["text"].toLowerCase() == searchText.toLowerCase();
    }, orElse: () => null);
    if (standardItem != null) {
      item = standardItem;
    }else{
      Map<String, dynamic>? socialItem = qrItems["SOCIAL"]?.firstWhere((item) {
        return item["text"].toLowerCase() == searchText.toLowerCase();
      }, orElse: () => null);
      item = socialItem;
    }


    return QRData(
      id: map['id'] as String,
      type: map['type'] as int,
      name: map['name'] as String,
      linkId: map['linkId'] ?? generateUniqueString(),
      data: Map.from((map['data'] as Map)),
      logo: map['logo'] != null ? map['logo'] as String : null,
      text: map['text'],
      color: map['color'],
      pixels: map['pixels'],
      isFavourite: map['isFavourite'] as bool,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      icon: item?['icon'],
      image: item?['image'],
      configuration: item?['configuration']
    );
  }

  String toJson() => json.encode(toMap());

  factory QRData.fromJson(String source) => QRData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QRData(type: $type, name: $name, data: $data, logo: $logo, text: $text, color: $color, pixels: $pixels, isFavourite: $isFavourite, created: $created, icon: $icon, image: $image)';
  }

  @override
  bool operator ==(covariant QRData other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.name == name &&
      mapEquals(other.data, data) &&
      other.logo == logo &&
      other.text == text &&
      other.configuration == configuration &&
      other.color == color &&
      other.pixels == pixels &&
      other.isFavourite == isFavourite &&
      other.created == created &&
      other.icon == icon &&
      other.image == image;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      name.hashCode ^
      data.hashCode ^
      logo.hashCode ^
      configuration.hashCode ^
      text.hashCode ^
      color.hashCode ^
      pixels.hashCode ^
      isFavourite.hashCode ^
      created.hashCode ^
      icon.hashCode ^
      image.hashCode;
  }
}
