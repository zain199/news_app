import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen/SearchScreen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/newscubit.dart';
import 'package:news_app/shared/cubit/newsstates.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  cubit.search=[];
                  NavigatorTo(context, SearchScreen());
                },
              ),

              IconButton(
                icon: Icon(Icons.brightness_4),
                onPressed: () {
                  cubit.setDark();
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.setBottomNavIndex(index);
            },
            currentIndex: cubit.bottomNavIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),

            ],
          ),
          body: cubit.screens[cubit.bottomNavIndex],
        );
      },
    );
  }
}
