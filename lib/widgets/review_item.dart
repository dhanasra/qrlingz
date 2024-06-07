import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/review_data.dart';

class ReviewItem extends StatelessWidget {
  final List<ReviewData> reviews;
  const ReviewItem({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...reviews.map(
          (e) => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            color: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: "Email".bs(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "1dhana625@gmail.com".bs(context),
                      ],
                    ),
                  
                    6.h(),
                  
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Phone".bs(context),
                        "unknown".bs(context),
                      ],
                    ),
                  ],
                ),
                  
                6.h(),
                
                "Categories".bs(context),
                  
                ...e.reviews.keys.map((key){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "$key".ts(context),
                          RatingBarIndicator(
                              rating: double.parse(e.reviews[key]['rating']),
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
                      
                      "${e.reviews[key]['comment']}".ts(context)
                    ],
                  );
                })
                  
              ],
            ),
          )
          
        )
      ],
    );
  }
}