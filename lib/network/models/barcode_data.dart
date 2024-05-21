// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:qrlingz_app/network/models/barcode_design.dart';

class BarcodeData {
  final String id;
  final String name;
  final String value;
  final BarcodeDesign design;
  final DateTime created;
  final String createdBy;


  BarcodeData({
    required this.id,
    required this.name,
    required this.value,
    required this.design,
    required this.created,
    required this.createdBy,
  });


  BarcodeData copyWith({
    String? id,
    String? name,
    String? value,
    BarcodeDesign? design,
    DateTime? created,
    String? createdBy,
  }) {
    return BarcodeData(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      design: design ?? this.design,
      created: created ?? this.created,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'value': value,
      'design': design.toMap(),
      'created': created.millisecondsSinceEpoch,
      'createdBy': createdBy,
    };
  }

  factory BarcodeData.fromMap(Map<String, dynamic> map) {
    return BarcodeData(
      id: map['id'] as String,
      name: map['name'] as String,
      value: map['value'] as String,
      design: BarcodeDesign.fromMap(map['design'] as Map<String,dynamic>),
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarcodeData.fromJson(String source) => BarcodeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BarcodeData(id: $id, name: $name, value: $value, design: $design, created: $created, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant BarcodeData other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.value == value &&
      other.design == design &&
      other.created == created &&
      other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      value.hashCode ^
      design.hashCode ^
      created.hashCode ^
      createdBy.hashCode;
  }
}
