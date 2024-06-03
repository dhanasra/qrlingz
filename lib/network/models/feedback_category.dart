// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackCategory {

  final String? icon;
  final String name;

  FeedbackCategory({
    this.icon,
    required this.name,
  });


  FeedbackCategory copyWith({
    String? icon,
    String? name,
  }) {
    return FeedbackCategory(
      icon: icon ?? this.icon,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'name': name,
    };
  }

  factory FeedbackCategory.fromMap(map) {
    return FeedbackCategory(
      icon: map['icon'] != null ? map['icon'] as String : null,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackCategory.fromJson(String source) => FeedbackCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedbackCategory(icon: $icon, name: $name)';

  @override
  bool operator ==(covariant FeedbackCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.icon == icon &&
      other.name == name;
  }

  @override
  int get hashCode => icon.hashCode ^ name.hashCode;
}
