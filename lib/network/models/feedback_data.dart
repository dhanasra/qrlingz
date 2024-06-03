// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:qrlingz_app/network/models/feedback_category.dart';
import 'package:qrlingz_app/network/models/feedback_design.dart';

class FeedbackData {

  final String company;
  final String? title;
  final String? description;
  final List<FeedbackCategory> categories;
  final bool emailMandatory;
  final bool phoneMandatory;
  final String? websiteUrl;
  final FeedbackDesign? design;

  FeedbackData({
    required this.company,
    this.title,
    this.description,
    required this.categories,
    this.emailMandatory = false,
    this.phoneMandatory = false,
    this.websiteUrl,
    this.design
  });

  FeedbackData copyWith({
    String? company,
    String? title,
    String? description,
    List<FeedbackCategory>? categories,
    bool? emailMandatory,
    bool? phoneMandatory,
    String? websiteUrl,
    FeedbackDesign? design
  }) {
    return FeedbackData(
      company: company ?? this.company,
      title: title ?? this.title,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      emailMandatory: emailMandatory ?? this.emailMandatory,
      phoneMandatory: phoneMandatory ?? this.phoneMandatory,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      design: design ?? design
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company': company,
      'title': title,
      'description': description,
      'categories': categories.map((x) => x.toMap()).toList(),
      'emailMandatory': emailMandatory,
      'phoneMandatory': phoneMandatory,
      'websiteUrl': websiteUrl,
      'design': design?.toMap()
    };
  }

  factory FeedbackData.fromMap(map) {
    return FeedbackData(
      company: map['company'] as String,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      categories: List<FeedbackCategory>.from((map['categories'] as List).map<FeedbackCategory>((x) => FeedbackCategory.fromMap(x))),
      emailMandatory: map['emailMandatory'] ?? false,
      phoneMandatory: map['phoneMandatory'] ?? false,
      websiteUrl: map['websiteUrl'] != null ? map['websiteUrl'] as String : null,
      design: map['design'] != null ? FeedbackDesign.fromMap(map['design']) : null
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackData.fromJson(String source) => FeedbackData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedbackData(company: $company, title: $title, description: $description, categories: $categories, emailMandatory: $emailMandatory, phoneMandatory: $phoneMandatory, websiteUrl: $websiteUrl)';
  }

  @override
  bool operator ==(covariant FeedbackData other) {
    if (identical(this, other)) return true;
  
    return 
      other.company == company &&
      other.title == title &&
      other.description == description &&
      listEquals(other.categories, categories) &&
      other.emailMandatory == emailMandatory &&
      other.phoneMandatory == phoneMandatory &&
      other.design == design &&
      other.websiteUrl == websiteUrl;
  }

  @override
  int get hashCode {
    return company.hashCode ^
      title.hashCode ^
      description.hashCode ^
      categories.hashCode ^
      emailMandatory.hashCode ^
      phoneMandatory.hashCode ^
      websiteUrl.hashCode ^
      design.hashCode;
  }
}
