part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

class Loading extends FeedbackState {}

class ReviewsFetched extends FeedbackState {
  final String rating;
  final Map categories;
  final List<ReviewData> reviews;
  ReviewsFetched({required this.reviews, required this.rating, required this.categories, });
}

final class Failure extends FeedbackState {}