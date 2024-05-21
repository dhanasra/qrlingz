// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:qrlingz_app/network/models/code_design.dart';
import 'package:qrlingz_app/network/models/content_design.dart';

class BarcodeDesign {

  final String? color;
  final String? background;
  final String? font;
  final double? borderRadius;
  final double? border;
  final String? borderColor;
  final String? alignment;
  final CodeDesign? code;
  final ContentDesign? content;

  
  BarcodeDesign({
    this.color,
    this.background,
    this.font,
    this.borderRadius,
    this.border,
    this.borderColor,
    this.alignment,
    this.code,
    this.content,
  });



  BarcodeDesign copyWith({
    String? color,
    String? background,
    String? font,
    double? borderRadius,
    double? border,
    String? borderColor,
    String? alignment,
    CodeDesign? code,
    ContentDesign? content,
  }) {
    return BarcodeDesign(
      color: color ?? this.color,
      background: background ?? this.background,
      font: font ?? this.font,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      borderColor: borderColor ?? this.borderColor,
      alignment: alignment ?? this.alignment,
      code: code ?? this.code,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'background': background,
      'font': font,
      'borderRadius': borderRadius,
      'border': border,
      'borderColor': borderColor,
      'alignment': alignment,
      'code': code?.toMap(),
      'content': content?.toMap(),
    };
  }

  factory BarcodeDesign.fromMap(Map<String, dynamic> map) {
    return BarcodeDesign(
      color: map['color'] != null ? map['color'] as String : null,
      background: map['background'] != null ? map['background'] as String : null,
      font: map['font'] != null ? map['font'] as String : null,
      borderRadius: map['borderRadius'] != null ? map['borderRadius'] as double : null,
      border: map['border'] != null ? map['border'] as double : null,
      borderColor: map['borderColor'] != null ? map['borderColor'] as String : null,
      alignment: map['alignment'] != null ? map['alignment'] as String : null,
      code: map['code'] != null ? CodeDesign.fromMap(map['code'] as Map<String,dynamic>) : null,
      content: map['content'] != null ? ContentDesign.fromMap(map['content'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarcodeDesign.fromJson(String source) => BarcodeDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BarcodeDesign(color: $color, background: $background, font: $font, borderRadius: $borderRadius, border: $border, borderColor: $borderColor, alignment: $alignment, code: $code, content: $content)';
  }

  @override
  bool operator ==(covariant BarcodeDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.background == background &&
      other.font == font &&
      other.borderRadius == borderRadius &&
      other.border == border &&
      other.borderColor == borderColor &&
      other.alignment == alignment &&
      other.code == code &&
      other.content == content;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      background.hashCode ^
      font.hashCode ^
      borderRadius.hashCode ^
      border.hashCode ^
      borderColor.hashCode ^
      alignment.hashCode ^
      code.hashCode ^
      content.hashCode;
  }
}
