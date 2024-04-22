import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/data_const.dart';

class QRData {
  final int type;
  final String name;
  final Map data;
  final bool isFavourite;
  final DateTime created;
  final IconData? icon;
  final String? image;

  QRData({
    required this.type,
    required this.name,
    required this.data,
    required this.isFavourite,
    required this.created,
    this.icon,
    this.image
  });

  QRData copyWith({
    int? type,
    String? name,
    Map? data,
    bool? isFavourite,
    DateTime? created,
  }) {
    return QRData(
      type: type ?? this.type,
      name: name ?? this.name,
      data: data ?? this.data,
      isFavourite: isFavourite ?? this.isFavourite,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'data': data,
      'isFavourite': isFavourite,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory QRData.fromMap(Map map) {

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
      type: map['type'] as int,
      name: map['name'] as String,
      data: Map.from((map['data'] as Map)),
      isFavourite: map['isFavourite'] as bool,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      icon: item?['icon'],
      image: item?['image']
    );
  }

  String toJson() => json.encode(toMap());

  factory QRData.fromJson(String source) => QRData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QRData(type: $type, name: $name, data: $data, isFavourite: $isFavourite, created: $created)';
  }

  @override
  bool operator ==(covariant QRData other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.name == name &&
      mapEquals(other.data, data) &&
      other.isFavourite == isFavourite &&
      other.created == created;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      name.hashCode ^
      data.hashCode ^
      isFavourite.hashCode ^
      created.hashCode;
  }
}
