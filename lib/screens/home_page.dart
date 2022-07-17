import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/layout/cubit/app_state.dart';
import 'package:one1/model/now_playing_model.dart';
import 'package:one1/model/populer_model.dart';
import 'package:one1/model/top_rated_model.dart';
import 'package:one1/model/trending.dart';
import 'package:one1/model/tv_model.dart';
import 'package:one1/model/upcoming_model.dart';
import 'package:one1/shared/widgets.dart';

TextStyle myCarouselSliderText = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
TextStyle myTitleText = TextStyle(
  color: Colors.grey[350],
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
TextStyle myCardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
TextStyle myTimePublishTextStyle = TextStyle(
  color: Colors.grey[350],
  fontSize: 14,fontWeight: FontWeight.w500
);

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return (AppCubit.get(context).trendingModel != null &&
                AppCubit.get(context).topRateModel != null &&
                AppCubit.get(context).popularModel != null&&
            AppCubit.get(context).nowPlayingModel != null &&
            AppCubit.get(context).tvModel!=null )
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(child:  CarouselSlider(
                      items: AppCubit.get(context)
                          .trendingModel
                          .results
                          .map(
                            (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image(
                                  height: 430,
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${e.posterPath}",
                                  ),
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.7),
                                  width: double.infinity,
                                  height: 170,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (e.originalTitle != null)
                                            ? Text(
                                          e.originalTitle.toString(),
                                          style: myCarouselSliderText,
                                        )
                                            : Text(
                                            e.originalName.toString(),
                                            style:
                                            myCarouselSliderText),
                                      ),
                                      (e.voteAverage == 0.0)
                                          ?const SizedBox(
                                        height: 0,
                                      )
                                          : RatingBar.builder(
                                        initialRating:
                                        e.voteAverage / 2,
                                        minRating: 1,itemSize: 32,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) =>
                                        const Icon(
                                          Icons.star,
                                          color: Colors.cyan,
                                        ),
                                        unratedColor: Colors.white70,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (e.releaseDate != null)
                                            ? Text(
                                          e.releaseDate.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight:
                                              FontWeight.w800),
                                        )
                                            : Text(
                                          e.firstAirDate.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                              fontWeight:
                                              FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                          .toList(),
                      options: CarouselOptions(
                        height: 450,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ), onTap: (){
                      print(AppCubit.get(context).trendingModel.results[1].id);

                      },),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Popular Movies',
                            style: myTitleText,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 280,
                            child: ListView.separated(
                                physics:const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => builderPopular(
                                    AppCubit.get(context)
                                        .popularModel
                                        .resultsP[index],context),
                                separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                itemCount: AppCubit.get(context)
                                    .popularModel
                                    .resultsP
                                    .length,
                                scrollDirection: Axis.horizontal),
                          ),
                          const  SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Now Playing',
                            style: myTitleText,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container( height: 280,
                          child:  ListView.separated(scrollDirection: Axis.horizontal,physics:const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  builderNowPlaying(AppCubit.get(context)
                                      .nowPlayingModel
                                      .NowPlayResults[index],context),
                              separatorBuilder: (context, index) =>const SizedBox(
                                width: 10,
                              ),
                              itemCount: AppCubit.get(context)
                                  .nowPlayingModel
                                  .NowPlayResults
                                  .length),),
                          const  SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Top Rated',
                            style: myTitleText,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 280,
                            child: ListView.separated(
                                physics:const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    builderTopRated(AppCubit.get(context)
                                        .topRateModel
                                        .topRatedResult[index],context),
                                separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                itemCount: AppCubit.get(context)
                                    .topRateModel
                                    .topRatedResult
                                    .length,
                                scrollDirection: Axis.horizontal),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Tv Shows',
                            style: myTitleText,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 280,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    builderTv(AppCubit.get(context)
                                        .tvModel.tvResults[index]),
                                separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                itemCount: AppCubit.get(context)
                                   .tvModel.tvResults.length,
                                scrollDirection: Axis.horizontal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }



 }
