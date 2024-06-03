// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackTheme {
  final String? font;
  final String? header;
  final String? background;
  final double? corner;
  final double? border;
  final String? borderColor;
  final int? shadow;

  FeedbackTheme({
    this.font,
    this.header,
    this.background,
    this.corner,
    this.border,
    this.borderColor,
    this.shadow,
  });

  FeedbackTheme copyWith({
    String? font,
    String? header,
    String? background,
    double? corner,
    double? border,
    String? borderColor,
    int? shadow,
  }) {
    return FeedbackTheme(
      font: font ?? this.font,
      header: header ?? this.header,
      background: background ?? this.background,
      corner: corner ?? this.corner,
      border: border ?? this.border,
      borderColor: borderColor ?? this.borderColor,
      shadow: shadow ?? this.shadow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'font': font,
      'header': header,
      'background': background,
      'corner': corner,
      'border': border,
      'borderColor': borderColor,
      'shadow': shadow,
    };
  }

  factory FeedbackTheme.fromMap(map) {
    return FeedbackTheme(
      font: map['font'] != null ? map['font'] as String : null,
      header: map['header'] != null ? map['header'] as String : null,
      background: map['background'] != null ? map['background'] as String : null,
      corner: map['corner'] != null ? map['corner'] as double : null,
      border: map['border'] != null ? map['border'] as double : null,
      borderColor: map['borderColor'] != null ? map['borderColor'] as String : null,
      shadow: map['shadow'] != null ? map['shadow'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackTheme.fromJson(String source) => FeedbackTheme.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedbackTheme(font: $font, header: $header, background: $background, corner: $corner, border: $border, borderColor: $borderColor, shadow: $shadow)';
  }

  @override
  bool operator ==(covariant FeedbackTheme other) {
    if (identical(this, other)) return true;
  
    return 
      other.font == font &&
      other.header == header &&
      other.background == background &&
      other.corner == corner &&
      other.border == border &&
      other.borderColor == borderColor &&
      other.shadow == shadow;
  }

  @override
  int get hashCode {
    return font.hashCode ^
      header.hashCode ^
      background.hashCode ^
      corner.hashCode ^
      border.hashCode ^
      borderColor.hashCode ^
      shadow.hashCode;
  }
}
