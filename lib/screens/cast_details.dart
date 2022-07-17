import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/layout/cubit/app_state.dart';
import 'package:one1/model/cast_info_model.dart';
import 'package:one1/screens/details.dart';

import 'home_page.dart';


class CastDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return      Scaffold(
            body: (AppCubit.get(context).castImageModel!=null&&
                AppCubit.get(context).castMoviesModel!=null&&
                AppCubit.get(context).castInfoModel!=null&& state is! CastInfoLoadingState )
                ?buildCastDetails(AppCubit.get(context).castInfoModel,context)
                : const Center(
              child: CircularProgressIndicator(),
            ),
          );

        },
      );
  }



  Widget buildCastDetails(CastInfoModel castInfoModel,context)=>ListView(
    children: [
      (castInfoModel.profilePath==null)?SizedBox():
      Image.network(
        "https://image.tmdb.org/t/p/w500${castInfoModel.profilePath}",
        height: 550,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return  Container(width:  MediaQuery.of(context).size.width,height: 550,child:
          Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
          // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
        },
      ),
      const SizedBox(
        height: 10,
      ),
      (castInfoModel.name=='')?SizedBox():
      Center(child: Text(castInfoModel.name,style: myCarouselSliderText,),),
      const SizedBox(
        height: 10,
      ),
      (castInfoModel.biography=='')?SizedBox():
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Biography",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      (castInfoModel.biography=='')?SizedBox():

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${castInfoModel.biography}",
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,

          ),maxLines: 13,
        ),
      ),
      ( AppCubit.get(context).castImageModel.profiles.length==0)?SizedBox():
       Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Image of ${castInfoModel.name} ",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      ( AppCubit.get(context).castImageModel.profiles.length==0)?SizedBox():

      Container(
        height: 230,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>

               buildCastImages(AppCubit.get(context).castImageModel.profiles[index], index),
            separatorBuilder: (context,index)=>SizedBox(width: 10,),
            itemCount: AppCubit.get(context).castImageModel.profiles.length),),
      (castInfoModel.knownForDepartment==null||castInfoModel.birthday==null||castInfoModel.placeOfBirth==null)?SizedBox():
      Card(

        elevation: 3,
        child: ExpansionTile(tilePadding: EdgeInsets.all(3),initiallyExpanded: true,
          title: Text('Personal Info', style:
          TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
          children: [Padding(padding: EdgeInsets.symmetric(horizontal: 10)
            ,child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Known for:  ',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                    Text(
                        '${castInfoModel.knownForDepartment}',
                        style:
                        const TextStyle(fontSize: 18,color: Colors.white70 ,)),   ],),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Birthday:  ',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                    Text('${castInfoModel.birthday}',
                        style:
                        TextStyle(fontSize: 16, color: Colors.white70)),],),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  const Text('Place of Birth:  ',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                  Text(castInfoModel.placeOfBirth,overflow: TextOverflow.ellipsis,maxLines: 1,
                      style:
                      const TextStyle(fontSize: 15, color: Colors.white70)),
                ],),
                SizedBox(
                  height: 20,
                ),

              ],) ,)

          ],backgroundColor: Colors.black,collapsedBackgroundColor: Colors.black,
          textColor: Colors.white,iconColor: Colors.white,collapsedTextColor: Colors.white,collapsedIconColor: Colors.white,

        ),
      ),SizedBox(height: 35,),

      (AppCubit.get(context).castMoviesModel.castMovies.length==0)?SizedBox():
      const Padding(
        padding: EdgeInsets.symmetric( horizontal: 8.0),
        child: Text(
          "Movies ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),SizedBox(height: 13,),
      (AppCubit.get(context).castMoviesModel.castMovies.length==0)?SizedBox():

      Container(
        height: 270,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>

                builderCastMovies(context,AppCubit.get(context).castMoviesModel.castMovies[index]),
            separatorBuilder: (context,index)=>SizedBox(width: 10,),
            itemCount: AppCubit.get(context).castMoviesModel.castMovies.length),),
    ],
  );



  Widget buildCastImages(Profiles profiles,index)=>InkWell(
    onTap: (){

    },
    child:Container(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          (profiles.filePath==null)?  Image.network(
            "http://www.lorrayndepeyer.com/wp-content/uploads/2016/09/profile_silhouette-1.png",

            height: 230,
            width: 150,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return  Container(width: 150,height: 230,child:
              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
            },

          ):
          Image.network(
            "https://image.tmdb.org/t/p/w500${profiles.filePath}",

            height: 230,
            width: 150,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return  Container(width: 150,height: 230,child:
              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
            },
          ),

        ],),)

    ,);

  Widget builderCastMovies(context,CastMovies castMovies) =>
      (castMovies.posterPath==null)?SizedBox(width: 0,):
      InkWell(child:
  Container(
    width: 130,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w500${castMovies.posterPath}",
          ),
          fit: BoxFit.cover,
          width: 130,
          height: 200,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return  Container(width: 150,height: 200,child:
            Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
            // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
          },
        ),
        Text(
          '${castMovies.title}',
          style: myCardTextStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${castMovies.releaseDate}',
          style: myTimePublishTextStyle,
        )
      ],
    ),
  ) ,
    onTap: (){
      print(castMovies.id);

      AppCubit.get(context).getDetails(castMovies.id);
      AppCubit.get(context).getTrailers(castMovies.id);
      AppCubit.get(context).getCast(castMovies.id);
      AppCubit.get(context).getSimilar(castMovies.id);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen()));
    },);

}
