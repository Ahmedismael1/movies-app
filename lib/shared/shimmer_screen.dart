import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width * 0.40 ,
                      height: 13,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),

                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      width:MediaQuery.of(context).size.width * 0.20 ,
                      height: 13,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 2,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      unratedColor: Colors.white70,
                      glowColor: Colors.grey,
                      itemSize: 18,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),

                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 50,width: MediaQuery.of(context).size.width * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),


                    ),

                  ],),

              ),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 16,width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),


          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 16,width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))

            ),


          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 16,width: MediaQuery.of(context).size.width * 0.86,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))

            ),


          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 16,width: MediaQuery.of(context).size.width * 0.82,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))

            ),


          ),     const SizedBox(
            height: 10,
          ),
          Container(
            height: 16,width: MediaQuery.of(context).size.width * 0.66,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))

            ),


          ),
        ],
      ),
    ));
  }
}
