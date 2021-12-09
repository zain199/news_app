import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/blocobcerver.dart';
import 'package:news_app/shared/cubit/newscubit.dart';
import 'package:news_app/shared/cubit/newsstates.dart';
import 'package:news_app/shared/network/local/Cache_Helper.dart';
import 'package:news_app/shared/network/remote/diohelper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Cache_Helper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getBusiness()..getsports()..getscience(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
         return  MaterialApp(
            theme: ThemeData(
                textTheme:  TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                primarySwatch: Colors.orange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 5.0,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.black,
                    type:BottomNavigationBarType.fixed
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  actionsIconTheme: IconThemeData(
                      color: Colors.black,
                      size: 35.0
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,


                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 0.0,
                  color: Colors.white,
                )
            ),
            darkTheme: ThemeData(
                textTheme:  TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                primarySwatch: Colors.orange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 5.0,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  type:BottomNavigationBarType.fixed,
                  backgroundColor: Colors.grey[900],
                ),
                scaffoldBackgroundColor: Colors.grey[900],
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  actionsIconTheme: IconThemeData(
                      color: Colors.white,
                      size: 35.0
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,


                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:Colors.grey[900],
                    statusBarIconBrightness: Brightness.light,
                  ),
                  elevation: 0.0,
                  color: Colors.grey[900],
                )
            ),
            themeMode: (Cache_Helper.getData('isDark')==null||Cache_Helper.getData('isDark'))? ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home :NewsLayout(),
          );
        },
      ),
    );
  }
}

