// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContentDesign {

  final String? text;
  final String? font;
  final String? color;
  final double? size;
  final String? layout;
  
  ContentDesign({
    this.text,
    this.font,
    this.color,
    this.size,
    this.layout,
  });


  ContentDesign copyWith({
    String? text,
    String? font,
    String? color,
    double? size,
    String? layout,
  }) {
    return ContentDesign(
      text: text ?? this.text,
      font: font ?? this.font,
      color: color ?? this.color,
      size: size ?? this.size,
      layout: layout ?? this.layout,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'font': font,
      'color': color,
      'size': size,
      'layout': layout,
    };
  }

  factory ContentDesign.fromMap(map) {
    return ContentDesign(
      text: map['text'] != null ? map['text'] as String : null,
      font: map['font'] != null ? map['font'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
      size: map['size'] != null ? map['size'] as double : null,
      layout: map['layout'] != null ? map['layout'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentDesign.fromJson(String source) => ContentDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContentDesign(text: $text, font: $font, color: $color, size: $size, layout: $layout)';
  }

  @override
  bool operator ==(covariant ContentDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.text == text &&
      other.font == font &&
      other.color == color &&
      other.size == size &&
      other.layout == layout;
  }

  @override
  int get hashCode {
    return text.hashCode ^
      font.hashCode ^
      color.hashCode ^
      size.hashCode ^
      layout.hashCode;
  }
}
