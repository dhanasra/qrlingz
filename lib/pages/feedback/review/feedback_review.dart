import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/feedback/bloc/feedback_bloc.dart';
import 'package:qrlingz_app/pages/feedback/review/feedback_reviewmodel.dart';
import 'package:qrlingz_app/widgets/review_item.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

class FeedbackReview extends StatefulWidget {
  final String id;
  const FeedbackReview({super.key, required this.id});

  @override
  State<FeedbackReview> createState() => _FeedbackReviewState();
}

class _FeedbackReviewState extends State<FeedbackReview> {
  late FeedbackReviewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = FeedbackReviewModel();
    context.read<FeedbackBloc>().add(GetReviewsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        centerTitle: false,
      ),
      body: BlocBuilder<FeedbackBloc, FeedbackState>(
        builder: (context, state) {

          if(state is ReviewsFetched){
            _viewModel.oaRating = state.rating;
            _viewModel.categories = state.categories;
            _viewModel.reviews = state.reviews;
          }

          if(state is Loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [

              

              StyledWrapper(
                m: const EdgeInsets.all(20),
                p: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    "Overall Rating".bs(context),

                    _viewModel.oaRating.ds(context),

                    RatingBarIndicator(
                        rating: double.parse(_viewModel.oaRating),
                        itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                    ),


                    12.h(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: "CATEGORIES".bs(context, color: Colors.grey),
                    ),

                    12.h(),

                    ..._viewModel.categories.keys.map((e)
                     => Padding(
                       padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 16
                      ),
                       child: Row(
                        children: [
                          "$e".ts(context),
                          const Spacer(),
                          "${_viewModel.categories[e]}".ts(context),
                          12.w(),
                          RatingBarIndicator(
                            rating: _viewModel.categories[e],
                            itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                       ),
                     ))
                    
                  ],
                )),

                ReviewItem(reviews: _viewModel.reviews)

            ],
          );
        },
      ),
    );
  }
}
