// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:qrlingz_app/network/models/feedback_content.dart';
import 'package:qrlingz_app/network/models/feedback_theme.dart';

class FeedbackDesign {
  final int? template;
  final FeedbackTheme? theme;
  final FeedbackContent? content;

  FeedbackDesign({
    this.template,
    this.theme,
    this.content,
  });

  FeedbackDesign copyWith({
    int? template,
    FeedbackTheme? theme,
    FeedbackContent? content,
  }) {
    return FeedbackDesign(
      template: template ?? this.template,
      theme: theme ?? this.theme,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'template': template,
      'theme': theme?.toMap(),
      'content': content?.toMap(),
    };
  }

  factory FeedbackDesign.fromMap(map) {
    return FeedbackDesign(
      template: map['template'] != null ? map['template'] as int : null,
      theme: map['theme'] != null ? FeedbackTheme.fromMap(map['theme']) : null,
      content: map['content'] != null ? FeedbackContent.fromMap(map['content']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackDesign.fromJson(String source) => FeedbackDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedbackDesign(template: $template, theme: $theme, content: $content)';

  @override
  bool operator ==(covariant FeedbackDesign other) {
    if (identical(this, other)) return true;
  
    return 
      other.template == template &&
      other.theme == theme &&
      other.content == content;
  }

  @override
  int get hashCode => template.hashCode ^ theme.hashCode ^ content.hashCode;
}
