// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ReviewData {
  final String? email;
  final String? phone;
  final Map reviews;

  ReviewData({
    this.email,
    this.phone,
    required this.reviews,
  });

  ReviewData copyWith({
    String? email,
    String? phone,
    Map? reviews,
  }) {
    return ReviewData(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'reviews': reviews,
    };
  }

  factory ReviewData.fromMap(map) {
    return ReviewData(
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      reviews: map['reviews']!=null ? Map.from((map['reviews'] as Map)) : {},
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewData.fromJson(String source) => ReviewData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReviewData(email: $email, phone: $phone, categories: $reviews)';

  @override
  bool operator ==(covariant ReviewData other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.phone == phone &&
      mapEquals(other.reviews, reviews);
  }

  @override
  int get hashCode => email.hashCode ^ phone.hashCode ^ reviews.hashCode;
}
