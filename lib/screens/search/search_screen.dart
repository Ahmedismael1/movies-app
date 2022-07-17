import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/screens/search/search_cubit.dart';
import 'package:one1/screens/search/search_state.dart';

import '../details.dart';
import '../home_page.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SearchCubit(),
    child:  BlocConsumer<SearchCubit,SearchState>(
      listener:(context,state){} ,
        builder: (context,state){
        return Scaffold(body:
        Column(children: [
          SizedBox(height: 30,),

Padding(padding: EdgeInsets.all(10),

  child: Container(
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
    child: TextFormField(

    controller: searchController,
    decoration: InputDecoration(
      labelText: "search",
      floatingLabelStyle: TextStyle(color: Colors.cyan),
      prefixIcon: IconButton(
        icon: Icon(Icons.search),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.blue, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return "Enter Text To Search";
      }
      return null;



    },
      onChanged: (val){
        SearchCubit.get(context).getSearch(val);

      },


  ),)),

          SizedBox(height: 10,),
          if(state is SearchLoadingState)
            const LinearProgressIndicator(),


          if (state is SearchSuccessState)

            buildSearchList(context)



        ],)
     );
        },
        )
    );
  }

   Widget buildSearchList(context)=>
       Expanded(child:   ListView.separated(itemBuilder: (context,index)=>
       buildSearch(SearchCubit.get(context).searchMoviesModel.results[index],context),
       separatorBuilder: (context,index)=>SizedBox(height: 15,),
       itemCount: SearchCubit.get(context).searchMoviesModel.results.length));


  Widget buildSearch(search,context)=>
      (search.backdropPath==null&&search.posterPath==null)?SizedBox(height: 0,)
          :
 InkWell(
   onTap: (){
     print(search.id);
     AppCubit.get(context).getDetails(search.id);
     AppCubit.get(context).getTrailers(search.id);
     AppCubit.get(context).getCast(search.id);
     AppCubit.get(context).getSimilar(search.id);

     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) => DetailsScreen()));
   },
   child:
   Padding(padding: EdgeInsets.symmetric(horizontal: 16),
     child: Row(children: [

       (search.posterPath!=null)?
       Image(
         image: NetworkImage(
           "https://image.tmdb.org/t/p/w500${search.posterPath}",
         ),
         fit: BoxFit.fill,
         width: 130,
         height: 150,
       ):

       Image(
         image: NetworkImage(
           "https://image.tmdb.org/t/p/w500${search.backdropPath}",
         ),
         fit: BoxFit.fill,
         width: 130,
         height: 150,
       ),
       Padding(padding: EdgeInsets.all(10),child:   Column(
         crossAxisAlignment: CrossAxisAlignment.start,      children: [
         Container(

           child: Text(
             '${search.title}',
             style: myCardTextStyle,
             overflow: TextOverflow.ellipsis,
             maxLines: 2,
           ),
           width: MediaQuery.of(context).size.width*0.5,
         ),
         SizedBox(height: 5,),
         Text(
           '${search.releaseDate}',
           style: TextStyle(
               fontSize: 20,
               color: Colors.grey,
               fontWeight:
               FontWeight.w800),
         ),
         Row(children: [
           RatingBar.builder(
             initialRating:
             search.voteAverage / 2,
             minRating: 1,itemSize: 22,
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
               child:  Text(
                 search.voteAverage.toString(),
                 style: const TextStyle(
                     fontSize: 20,
                     color: Colors.grey,
                     fontWeight:
                     FontWeight.w800),
               )

           ),
         ],)

       ],),)

     ],),),);
}
