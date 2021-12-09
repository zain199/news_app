import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';
import 'package:news_app/shared/cubit/newsstates.dart';
import 'package:news_app/shared/network/local/Cache_Helper.dart';
import 'package:news_app/shared/network/remote/diohelper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsInitState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  void setBottomNavIndex(index) {
    bottomNavIndex = index;
    emit(NewsBottomNavState());
  }

  List<Widget>screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  List<dynamic> business = [];


  void getBusiness() async {

    emit(NewsBusinessLoadingState());
    DioHelper.getData(
        path: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'d987ea445b444d3091961a56e29e5e8c'
        },
    ).then((value)
    {
        business = value.data['articles'];

        emit(NewsBusinessSuccessState());
    }

    ).catchError((onError)
    {
      print(onError.toString());
      emit(NewsBusinessErrorState());
    });
  }

  List<dynamic> sports = [];

  void getsports() async {

    emit(NewsSportsLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'d987ea445b444d3091961a56e29e5e8c'
      },
    ).then((value)
    {
      sports = value.data['articles'];
      emit(NewsSportsSuccessState());
    }

    ).catchError((onError)
    {
      print(onError.toString());
      emit(NewsSportsErrorState());
    });
  }

  List<dynamic> science = [];

  void getscience() async
  {

    emit(NewsScienceLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':'d987ea445b444d3091961a56e29e5e8c'
      },
    ).then((value)
    {
      science = value.data['articles'];
      emit(NewsScienceSuccessState());
    }

    ).catchError((onError)
    {
      print(onError.toString());
      emit(NewsScienceErrorState());
    });
  }

  bool isDark = false;
 
  void setDark ()
  {
    isDark = !isDark;

    Cache_Helper.setData('isDark', isDark).then((value) {
      emit(NewsModeState());
    });
  }

  List<dynamic> search = [];

  void getsearch(String value) async
  {

    emit(NewsSearchLoadingState());
    DioHelper.getData(
      path: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'d987ea445b444d3091961a56e29e5e8c'
      },
    ).then((value)
    {
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }

    ).catchError((onError)
    {
      print(onError.toString());
      emit(NewsSearchErrorState());
    });
  }



}