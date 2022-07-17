import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/layout/cubit/app_state.dart';
import 'package:one1/model/cast_model.dart';
import 'package:one1/model/details_model.dart';
import 'package:one1/model/similar_model.dart';
import 'package:one1/model/trailers_model.dart';
import 'package:one1/screens/cast_details.dart';
import 'package:one1/screens/view_trails.dart';
import 'package:one1/shared/shimmer_screen.dart';

import 'home_page.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(child: WillPopScope(
            child: Scaffold(
              body: (AppCubit.get(context).detailsModel != null &&
                  AppCubit.get(context).trailersModel != null &&
                  AppCubit.get(context).castModel != null &&
                  AppCubit.get(context).similarModel != null &&
                  state is! SimilarLoadingState)
                  ? buildOfDetails(
                  context,
                  AppCubit.get(context).detailsModel,
                  AppCubit.get(context).castModel.cast[0],
                  AppCubit.get(context).trailersModel)
                  :ShimmerScreen(),
            ),
            onWillPop: () {
              AppCubit.get(context).detailsModel = null;
              Navigator.pop(context);
            }));
      },
    );
  }

  Widget buildOfDetails(context, DetailsModel details, Cast crew,
          TrailersModel trailersResults) => ListView(
        children: [
          (details.backdropPath == null)
              ?
          Image.network(
                  "https://image.tmdb.org/t/p/w500${details.posterPath}",
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return  Container(width: MediaQuery.of(context).size.width,height: 350,child:
              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
            },
                )
              : Image.network(

                  "https://image.tmdb.org/t/p/w500${details.backdropPath}",
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return  Container(width: MediaQuery.of(context).size.width,height: 350,child:
              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
            },
                ),

          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (details.posterPath == null)
                    ? Image.network(
                        "https://image.tmdb.org/t/p/w500${details.backdropPath}",
                        height: 180,
                        width: MediaQuery.of(context).size.width * 0.34,
                        fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: MediaQuery.of(context).size.width*0.34,height: 180,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },
                      )
                    : Image.network(
                        "https://image.tmdb.org/t/p/w500${details.posterPath}",
                        height: 180,
                        width: MediaQuery.of(context).size.width * 0.34,
                        fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: MediaQuery.of(context).size.width*0.34,height: 180,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },
                      ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${details.originalTitle} ",
                      overflow: TextOverflow.ellipsis,
                      textWidthBasis: TextWidthBasis.parent,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (details.genres.length <= 0)
                        ? SizedBox()
                        : (details.genres.length <= 1)
                            ? Text(
                                // "${myProvider.homePageUrl}",
                                "${details.genres[0].name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                // "${myProvider.homePageUrl}",
                                "${details.genres[0].name},${details.genres[1].name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          initialRating: details.voteAverage / 2,
                          minRating: 2,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          ignoreGestures: true,
                          unratedColor: Colors.white70,
                          glowColor: Colors.cyan,
                          itemSize: 20,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.cyan,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${details.voteAverage}/10",
                          style: TextStyle(fontSize: 18, color: Colors.cyan),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.favorite,
                            size: 27,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Add to Favorite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.grey[200].withAlpha(150),
                          maximumSize: Size(
                              MediaQuery.of(context).size.width * 0.50, 80)),
                    )
                  ],
                ),
              )
            ],
          ),
          (details.overview == '')
              ? SizedBox()
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          (details.overview == '')
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${details.overview}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
          (AppCubit.get(context).trailersModel.trailersResults.length == 0)
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Trailers ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          (AppCubit.get(context).trailersModel.trailersResults.length == 0)
              ? const SizedBox()
              : Container(
                  height: 180,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildTrails(
                          AppCubit.get(context)
                              .trailersModel
                              .trailersResults[index],
                          AppCubit.get(context).detailsModel,
                          context),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: AppCubit.get(context)
                          .trailersModel
                          .trailersResults
                          .length),
                ),
          (AppCubit.get(context).castModel.cast.length == 0)
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Cast ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          const SizedBox(
            height: 13,
          ),
          (AppCubit.get(context).castModel.cast.length == 0)
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    height: 270,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildCast(
                            AppCubit.get(context).castModel.cast[index],
                            context),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: AppCubit.get(context).castModel.cast.length),
                  ),
                ),
          (details.runtime == null ||
                  crew.name == null ||
                  details.releaseDate == null)
              ? const SizedBox()
              : Card(
                  elevation: 3,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(3),
                    initiallyExpanded: true,
                    title: Text('About Movie',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Runtime:  ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('${details.runtime} min',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('Writers:  ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(crew.name,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white70)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('Director:  ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(crew.name,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white70)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('Released on:  ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(details.releaseDate,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white70)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                    backgroundColor: Colors.black,
                    collapsedBackgroundColor: Colors.black,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    collapsedIconColor: Colors.white,
                  ),
                ),
          const SizedBox(
            height: 43,
          ),
          (AppCubit.get(context).similarModel.similarResults.length == 0)
              ? const SizedBox()
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "You might also like ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          const SizedBox(
            height: 3,
          ),
          (AppCubit.get(context).similarModel.similarResults.length == 0)
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    height: 270,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => builderSimilar(
                              context,
                              AppCubit.get(context)
                                  .similarModel
                                  .similarResults[index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: AppCubit.get(context)
                            .similarModel
                            .similarResults
                            .length),
                  ),
                )
        ],
      );

  Widget buildTrails(TrailersResults trailersResults, DetailsModel detailsModel,
      context) => InkWell(
        onTap: () {
          print(trailersResults.key);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewTrailers(
                        keyId: trailersResults.key,
                      )));

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 110,
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${detailsModel.backdropPath}",
                      height: 100,
                      width: 180,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return  Container(width: 180,height: 100,child:
                        Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                    Icon(
                      Icons.play_circle_outline_outlined,
                      size: 55,
                      color: Colors.redAccent[700],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${trailersResults.name}",
                  overflow: TextOverflow.ellipsis,
                  textWidthBasis: TextWidthBasis.parent,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildCast(Cast cast, context) => InkWell(
        onTap: () {
          print(cast.id);
          AppCubit.get(context).getCastImage(cast.id);
          AppCubit.get(context).getCastInfo(cast.id);
          AppCubit.get(context).getCastMovies(cast.id);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CastDetails()));
        },
        child: Container(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (cast.profilePath == null)
                  ? Image.network(
                      "http://www.lorrayndepeyer.com/wp-content/uploads/2016/09/profile_silhouette-1.png",
                      height: 180,
                      width: 120,
                      fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 120,height: 180,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

                    )
                  : Image.network(
                      "https://image.tmdb.org/t/p/w500${cast.profilePath}",
                      height: 180,
                      width: 120,
                      fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 120,height: 180,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },
                    ),
              Text(
                cast.name,
                overflow: TextOverflow.ellipsis,
                textWidthBasis: TextWidthBasis.parent,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (cast.character=='')?SizedBox():
              Text(
                '(${cast.character})',
                overflow: TextOverflow.ellipsis,
                textWidthBasis: TextWidthBasis.parent,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget builderSimilar(context, SimilarResults similarResults) => InkWell(
        child: Container(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${similarResults.posterPath}",
                ),
                fit: BoxFit.cover,
                width: 130,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 130,height: 180,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },
              ),
              Text(
                '${similarResults.title}',
                style: myCardTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${similarResults.releaseDate}',
                style: myTimePublishTextStyle,
              )
            ],
          ),
        ),
        onTap: () {
          print(similarResults.id);

          AppCubit.get(context).getDetails(similarResults.id);
          AppCubit.get(context).getTrailers(similarResults.id);
          AppCubit.get(context).getCast(similarResults.id);
          AppCubit.get(context).getSimilar(similarResults.id);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DetailsScreen()));
        },
      );
}
