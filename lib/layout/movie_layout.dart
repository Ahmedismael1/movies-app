import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one1/layout/cubit/app_cubit.dart';
import 'package:one1/layout/cubit/app_state.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(

          child: Scaffold(
            body: AppCubit.get(context)
                .bottomScreens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                AppCubit.get(context).changeScreen(index);
                //HomePageCubit.get(context).getAllFavourite();
              },
              currentIndex: AppCubit.get(context).currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
              ],
            ),
          ),
        );
      },
    );
  }
}
