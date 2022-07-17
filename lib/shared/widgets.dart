import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/model/now_playing_model.dart';
import 'package:one1/model/populer_model.dart';
import 'package:one1/model/top_rated_model.dart';
import 'package:one1/model/tv_model.dart';
import 'package:one1/screens/details.dart';
import 'package:one1/screens/home_page.dart';

Widget builderTopRated(TopRateResult topRateModel,context) =>InkWell(
  child:  Container(
    width: 130,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network('https://image.tmdb.org/t/p/w500${topRateModel.posterPath}',
          fit: BoxFit.cover,
          width: 130,
          height: 200,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return  Container(width: 130,height: 200,child:
            Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey,)),);
            // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
          },

        ),
        Text(
          '${topRateModel.title}',
          style: myCardTextStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${topRateModel.releaseDate}',
          style: myTimePublishTextStyle,
        )
      ],
    ),
  ),
  onTap: (){
    print(topRateModel.id);
    AppCubit.get(context).getDetails(topRateModel.id);
    AppCubit.get(context).getTrailers(topRateModel.id);
    AppCubit.get(context).getCast(topRateModel.id);
    AppCubit.get(context).getSimilar(topRateModel.id);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen()));

  },
);

Widget builderNowPlaying(ResultsNowPlay nowPlay,context) => InkWell(child:
Container(
  width: 130,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network('https://image.tmdb.org/t/p/w500${nowPlay.posterPath}',
        fit: BoxFit.cover,
        width: 130,
        height: 200,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return  Container(width: 130,height: 200,child:
          Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
          // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
        },

      ),
      Text(
        '${nowPlay.title}',
        style: myCardTextStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '${nowPlay.releaseDate}',
        style: myTimePublishTextStyle,
      )
    ],
  ),
) ,
  onTap: (){
  print(nowPlay.id);

  AppCubit.get(context).getDetails(nowPlay.id);
  AppCubit.get(context).getTrailers(nowPlay.id);
  AppCubit.get(context).getCast(nowPlay.id);
  AppCubit.get(context).getSimilar(nowPlay.id);

  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsScreen()));
  },);

Widget builderPopular(ResultsP popular,context) => InkWell(
      child: Container(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://image.tmdb.org/t/p/w500${popular.posterPath}',
            fit: BoxFit.cover,
              width: 130,
               height: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return  Container(width: 130,height: 200,child:
              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
            },

          ),
          // Image(
          //   image: NetworkImage(
          //     "https://image.tmdb.org/t/p/w500${popular.posterPath}",
          //   ),
          //   fit: BoxFit.cover,
          //   width: 130,
          //   height: 200,
          // ),
          Text(
            '${popular.title}',
            style: myCardTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${popular.releaseDate}',
            style: myTimePublishTextStyle,
          )
        ],
      ),
    )
      ,onTap: (){
      print(popular.id);
      AppCubit.get(context).getDetails(popular.id);
      AppCubit.get(context).getTrailers(popular.id);
      AppCubit.get(context).getCast(popular.id);
      AppCubit.get(context).getSimilar(popular.id);


      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen()));

      },);

Widget builderTv(TvResults tvResults) =>InkWell(
  child:  Container(
  width: 130,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network('https://image.tmdb.org/t/p/w500${tvResults.posterPath}',
        fit: BoxFit.cover,
        width: 130,
        height: 200,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return  Container(width: 130,height: 200,child:
          Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
          // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
        },

      ),
      Text(
        '${tvResults.originalName}',
        style: myCardTextStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '${tvResults.firstAirDate}',
        style: myTimePublishTextStyle,
      )
    ],
  ),
),
  onTap: (){
  print(tvResults.id);
  },);

