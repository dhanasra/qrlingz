// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:qrlingz_app/network/models/barcode_design.dart';
import 'package:qrlingz_app/utils/utils.dart';

class BarcodeData {
  final String id;
  final String name;
  final int type;
  final String linkId;
  final String value;
  final BarcodeDesign design;
  final DateTime created;

  
  BarcodeData({
    required this.id,
    required this.name,
    required this.linkId,
    required this.type,
    required this.value,
    required this.design,
    required this.created,
  });
  

  BarcodeData copyWith({
    String? id,
    String? name,
    int? type,
    String? linkId,
    String? value,
    BarcodeDesign? design,
    DateTime? created,
  }) {
    return BarcodeData(
      id: id ?? this.id,
      linkId: linkId ?? this.linkId,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
      design: design ?? this.design,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'linkId': linkId,
      'value': value,
      'design': design.toMap(),
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory BarcodeData.fromMap(map) {
    return BarcodeData(
      id: map['id'] as String,
      name: map['name'] as String,
      linkId: map['linkId'] ?? generateUniqueString(),
      type: map['type'] as int,
      value: map['value'] as String,
      design: BarcodeDesign.fromMap(map['design']),
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BarcodeData.fromJson(String source) => BarcodeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BarcodeData(id: $id, name: $name, type: $type, value: $value, design: $design, created: $created)';
  }

  @override
  bool operator ==(covariant BarcodeData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.type == type &&
      other.value == value &&
      other.design == design &&
      other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      value.hashCode ^
      design.hashCode ^
      created.hashCode;
  }
}
