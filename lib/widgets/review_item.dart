import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qrlingz_app/constants/color_const.dart';
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
                      backgroundColor: ColorConst.colors[Random().nextInt(10)],
                      child: (e.email?.substring(0, 1).toUpperCase()??'U').tl(context, color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        e.email?.ts(context),
                        4.h(),
                        e.phone?.bs(context),
                        if(e.email==null && e.phone==null)
                        "Unknown".tl(context)
                      ],
                    ),
                  ],
                ),
                  
                12.h(),
                
                "Categories".tl(context),

                12.h(),
                  
                ...e.reviews.keys.map((key){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "$key".bs(context),
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
                        2.h(),
                        
                        "${e.reviews[key]['comment']}".bs(context)
                      ],
                    ),
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