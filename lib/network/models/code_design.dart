// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CodeDesign {

  final String? color;
  final String? background;
  final String? backgroundColor;
  final bool showText;
  final String? font;
  final String? textColor;
  final double? textSize;
  final double? padding;


  CodeDesign({
    this.color,
    this.showText = true,
    this.background,
    this.backgroundColor,
    this.font,
    this.textColor,
    this.textSize,
    this.padding,
  });


  CodeDesign copyWith({
    String? color,
    String? background,
    bool? showText,
    String? backgroundColor,
    String? font,
    String? textColor,
    double? textSize,
    double? padding,
  }) {
    return CodeDesign(
      showText: showText ?? this.showText,
      color: color ?? this.color,
      background: background ?? this.background,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      font: font ?? this.font,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'showText': showText,
      'background': background,
      'backgroundColor': backgroundColor,
      'font': font,
      'textColor': textColor,
      'textSize': textSize,
      'padding': padding,
    };
  }

  factory CodeDesign.fromMap(Map<String, dynamic> map) {
    return CodeDesign(
      showText: map['showText'] ?? true,
      color: map['color'] != null ? map['color'] as String : null,
      background: map['background'] != null ? map['background'] as String : null,
      backgroundColor: map['backgroundColor'] != null ? map['backgroundColor'] as String : null,
      font: map['font'] != null ? map['font'] as String : null,
      textColor: map['textColor'] != null ? map['textColor'] as String : null,
      textSize: map['textSize'] != null ? map['textSize'] as double : null,
      padding: map['padding'] != null ? map['padding'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeDesign.fromJson(String source) => CodeDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CodeDesign(color: $color, background: $background, backgroundColor: $backgroundColor, font: $font, textColor: $textColor, textSize: $textSize, padding: $padding)';
  }

  @override
  bool operator ==(covariant CodeDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.color == color &&
      other.showText == showText &&
      other.background == background &&
      other.backgroundColor == backgroundColor &&
      other.font == font &&
      other.textColor == textColor &&
      other.textSize == textSize &&
      other.padding == padding;
  }

  @override
  int get hashCode {
    return color.hashCode ^
      showText.hashCode ^
      background.hashCode ^
      backgroundColor.hashCode ^
      font.hashCode ^
      textColor.hashCode ^
      textSize.hashCode ^
      padding.hashCode;
  }
}
