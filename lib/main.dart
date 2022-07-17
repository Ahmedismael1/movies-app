import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one1/layout/movie_layout.dart';
import 'package:one1/shared/dio_helper.dart';

import 'layout/cubit/app_cubit.dart';
import 'layout/cubit/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [

          BlocProvider(create: (context)=>AppCubit()..getTrending()..getTopRated()..getPopular()..getNowPlay()..getTv())
        ],

        child: BlocConsumer<AppCubit,AppState>(
          listener: (context,state){},
          builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Movie App',
              theme: ThemeData(
                bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor: Colors.black,
                    unselectedItemColor: Colors.grey,
                elevation: 15),
                scaffoldBackgroundColor: Colors.black,
                primarySwatch: Colors.blue,

              ),
              home: HomeLayout(),
            );
          },
        )

      );
  }
}
