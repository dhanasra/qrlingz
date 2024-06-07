import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/review_data.dart';

class FeedbackReviewModel extends BaseViewModel {
  
  String oaRating = "0";
  Map categories = {};
  List<ReviewData> reviews = [];

  
  @override
  dispose() {

  }
}