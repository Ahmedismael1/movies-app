

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one1/model/search_model.dart';
import 'package:one1/screens/search/search_state.dart';
import 'package:one1/shared/constant.dart';
import 'package:one1/shared/dio_helper.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit ():super (InitialSearchState());

 static SearchCubit get(context)=>BlocProvider.of(context);


  SearchMoviesModel searchMoviesModel;
  void getSearch(String query){
    emit(SearchLoadingState());
    DioHelper.get('search/movie?api_key=$APIKey&language=en-US&query=$query&page=1&include_adult=false')
        .then((value) {
          searchMoviesModel=SearchMoviesModel.fromJson(value.data);
          print(value.data.toString()) ;
          emit(SearchSuccessState());
    })
        .catchError((onError){
          print(onError.toString());
          emit(SearchErrorState());
    });

  }

}