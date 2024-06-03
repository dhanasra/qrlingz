// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackContent {

  final String? companyColor;
  final String? titleColor;
  final String? descColor;
  final String? categoryColor;
  final String? iconColor;

  FeedbackContent({
    this.companyColor,
    this.titleColor,
    this.descColor,
    this.categoryColor,
    this.iconColor,
  });


  FeedbackContent copyWith({
    String? companyColor,
    String? titleColor,
    String? descColor,
    String? categoryColor,
    String? iconColor,
  }) {
    return FeedbackContent(
      companyColor: companyColor ?? this.companyColor,
      titleColor: titleColor ?? this.titleColor,
      descColor: descColor ?? this.descColor,
      categoryColor: categoryColor ?? this.categoryColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyColor': companyColor,
      'titleColor': titleColor,
      'descColor': descColor,
      'categoryColor': categoryColor,
      'iconColor': iconColor,
    };
  }

  factory FeedbackContent.fromMap(Map<String, dynamic> map) {
    return FeedbackContent(
      companyColor: map['companyColor'] != null ? map['companyColor'] as String : null,
      titleColor: map['titleColor'] != null ? map['titleColor'] as String : null,
      descColor: map['descColor'] != null ? map['descColor'] as String : null,
      categoryColor: map['categoryColor'] != null ? map['categoryColor'] as String : null,
      iconColor: map['iconColor'] != null ? map['iconColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackContent.fromJson(String source) => FeedbackContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedbackContent(companyColor: $companyColor, titleColor: $titleColor, descColor: $descColor, categoryColor: $categoryColor, iconColor: $iconColor)';
  }

  @override
  bool operator ==(covariant FeedbackContent other) {
    if (identical(this, other)) return true;
  
    return 
      other.companyColor == companyColor &&
      other.titleColor == titleColor &&
      other.descColor == descColor &&
      other.categoryColor == categoryColor &&
      other.iconColor == iconColor;
  }

  @override
  int get hashCode {
    return companyColor.hashCode ^
      titleColor.hashCode ^
      descColor.hashCode ^
      categoryColor.hashCode ^
      iconColor.hashCode;
  }
}
