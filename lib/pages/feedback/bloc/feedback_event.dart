// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class GetReviewsEvent extends FeedbackEvent {
  final String id;
  GetReviewsEvent({
    required this.id,
  });
}
