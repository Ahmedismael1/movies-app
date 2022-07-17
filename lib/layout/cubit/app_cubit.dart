import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one1/layout/cubit/app_state.dart';
import 'package:one1/model/account_model.dart';
import 'package:one1/model/cast_info_model.dart';
import 'package:one1/model/cast_model.dart';
import 'package:one1/model/details_model.dart';
import 'package:one1/model/now_playing_model.dart';
import 'package:one1/model/populer_model.dart';
import 'package:one1/model/similar_model.dart';
import 'package:one1/model/top_rated_model.dart';
import 'package:one1/model/trailers_model.dart';
import 'package:one1/model/trending.dart';
import 'package:one1/model/tv_model.dart';
import 'package:one1/model/upcoming_model.dart';
import 'package:one1/screens/favourite.dart';
import 'package:one1/screens/home_page.dart';
import 'package:one1/screens/search.dart';
import 'package:one1/screens/search/search_screen.dart';
import 'package:one1/shared/constant.dart';
import 'package:one1/shared/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    HomePageScreen(),
    SearchScreen(),
    FavouriteScreen()
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(NavBarState());
  }

  TrendingModel trendingModel;

  void getTrending() {
    emit(TrendingLoadingState());
    DioHelper.get('$TRENDING$APIKey').then((value) {
      trendingModel = TrendingModel.fromJson(value.data);
     // print('11111111');
      emit(TrendingSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(TrendingErrorState());
    });
  }

  TopRateModel topRateModel;

//https://api.themoviedb.org/3/movie/upcoming?api_key=454e2ecad8ed0ba440957a9c81173d0c&language=en-US&page=1
  void getTopRated() {

    emit(TopRatedLoadingState());
    DioHelper.get('${TopRated}${APILAGPAGE}').then((value) {
      topRateModel = TopRateModel.fromJson(value.data);
     // print('222222222');
      emit(TopRatedSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(TopRatedErrorState());
    });
  }

  PopularModel popularModel;

  void getPopular() {
    emit(PopularLoadingState());
    DioHelper.get('$POPULAER$APILAGPAGE').then((value) {
      popularModel = PopularModel.fromJson(value.data);
      //print('33333333');
      //print(popularModel.resultsP[1].posterPath);
      emit(PopularSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PopularErrorState());
    });
  }

  NowPlayingModel nowPlayingModel;

  void getNowPlay() {
    emit(NowPlayingLoadingState());
    DioHelper.get('$NOWPLAYING$APILAGPAGE').then((value) {
      nowPlayingModel = NowPlayingModel.fromJson(value.data);
     // print('444444444');
      emit(NowPlayingSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(NowPlayingErrorState());
    });
  }

  TvModel tvModel;
  void getTv() {
    emit(TvLoadingState());
    DioHelper.get('$TV$APILAGPAGE').then((value) {
      tvModel = TvModel.fromJson(value.data);
     // print('555555555');
      emit(TvSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(TvErrorState());
    });
  }


  DetailsModel detailsModel;
  void getDetails(int id)
  {emit(DetailsLoadingState());
    DioHelper.get('movie/$id?api_key=$APIKey&language=en-US')
        .then((value) {
          detailsModel=DetailsModel.fromJson(value.data);
          print('66666666666');
          emit(DetailsSuccessState());
    })
        .catchError((onError){
          print(onError);
          emit(DetailsErrorState());
    });

  }


  TrailersModel trailersModel;
  void getTrailers(int id)
  {
    emit(TrailerLoadingState());
    DioHelper.get('movie/$id/videos?api_key=$APIKey&language=en-US')
        .then((value) {
          trailersModel=TrailersModel.fromJson(value.data);
          print('7777777777');
emit(TrailerSuccessState());

    })
        .catchError((onError){
          print(onError);
          emit(TrailerErrorState());

    });
  }
  CastModel castModel;
  void getCast(int id){
emit(CastLoadingState());
    DioHelper.get('movie/$id/credits?api_key=$APIKey&language=en-US')
        .then((value) {
          castModel=CastModel.fromJson(value.data);
          print('88888888');

          emit(CastSuccessState());
    })
        .catchError((onError){
          print(onError);
          emit(CastErrorState());

    });

  }

  SimilarModel similarModel;
  //https://api.themoviedb.org/3/movie/634649/similar?api_key=454e2ecad8ed0ba440957a9c81173d0c&language=en-US&page=1
  void getSimilar(int id){
emit(SimilarLoadingState());
    DioHelper.get('movie/$id/similar?api_key=$APILAGPAGE')
        .then((value) {

          similarModel=SimilarModel.fromJson(value.data);
          print('99999999999');

          emit(SimilarSuccessState());
    })
        .catchError((onError){
          print(onError);
          emit(SimilarErrorState());

    });

  }
  //https://api.themoviedb.org/3/person/71580?api_key=454e2ecad8ed0ba440957a9c81173d0c&language=en-US
  CastInfoModel castInfoModel;
  void getCastInfo(int id){
    emit(CastInfoLoadingState());
    DioHelper.get('person/$id?api_key=$APIKey&language=en-US')
        .then((value) {

castInfoModel =CastInfoModel.fromJson(value.data);
          print('10101010');
          emit(CastInfoSuccessState());

    })
        .catchError((onError){
          print(onError);
emit(CastInfoErrorState());
    });

  }

//https://api.themoviedb.org/3/person/71580/images?api_key=454e2ecad8ed0ba440957a9c81173d0c
  CastImageModel castImageModel;
  void getCastImage(int id){
    DioHelper.get('person/$id/images?api_key=$APIKey')
        .then((value) {

castImageModel=CastImageModel.fromJson(value.data);
print('1111101101');

    })
        .catchError((onError){
          print(onError);

    });

  }


  //https://api.themoviedb.org/3/person/71580/movie_credits?api_key=454e2ecad8ed0ba440957a9c81173d0c&language=en-US
  CastMoviesModel castMoviesModel;
  void getCastMovies(int id){
    DioHelper.get('person/$id/movie_credits?api_key=$APIKey&language=en-US')
        .then((value) {
castMoviesModel =CastMoviesModel.fromJson(value.data);
          print('12121212');

    })
        .catchError((onError){
          print(onError);

    });

  }
//   IdModel idModel;
//   void getId(){
//     DioHelper.get('account?api_key=454e2ecad8ed0ba440957a9c81173d0c')
//         .then((value) {
// idModel=IdModel.fromJson(value.data);
// print(value.data.toString());
//           print('12121212');
//
//     })
//         .catchError((onError){
//           print(onError);
//
//     });
//
//   }

}
