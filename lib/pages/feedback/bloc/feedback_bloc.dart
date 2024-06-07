import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../network/firebase_client.dart';
import '../../../network/models/review_data.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<GetReviewsEvent>(_onGetReviews);
  }
  
  final FirebaseClient _client = FirebaseClient();

  _onGetReviews(GetReviewsEvent event, Emitter emit) async {
    try{
      emit(Loading());

      var res = await _client.feedbackDB.doc(event.id).collection(Collection.reviews).get();
      var data =  res.docs.map((e) => ReviewData.fromMap(e.data())).toList();
      Map averages = calculateAverageRatings(data.map((e) => e.toMap()).toList());

      emit(ReviewsFetched(rating: "${averages['rating']}",categories: averages['categories'], reviews: data));
    }catch(e){
      emit(Failure());
    }
  }

  Map calculateAverageRatings(List<Map<String, dynamic>> data) {
    Map<String, int> categorySums = {};
    Map<String, int> categoryCounts = {};

    int totalSum = 0;
    int totalCount = 0;

    // Iterate through the data
    for (var entry in data) {
      var reviews = entry['reviews'] ?? {};
      reviews.forEach((category, review) {
        int rating = int.tryParse(review['rating'] ?? '0') ?? 0;
        
        // Update the sum and count for each category
        if (!categorySums.containsKey(category)) {
          categorySums[category] = 0;
          categoryCounts[category] = 0;
        }
        categorySums[category] = categorySums[category]! + rating;
        categoryCounts[category] = categoryCounts[category]! + 1;

        totalSum += rating;
        totalCount += 1;
      });
    }

    // Calculate the average rating for each category
    Map<String, double> categoryAverages = {};
    categorySums.forEach((category, sum) {
      if (categoryCounts[category]! > 0) {
        categoryAverages[category] = (sum / categoryCounts[category]!).toPrecision(1);
      }
    });

    double overallAverage = (totalCount > 0 ? totalSum / totalCount : 0.0).toPrecision(1);

    return {
      "rating": overallAverage,
      "categories": categoryAverages
    };
  }
}
