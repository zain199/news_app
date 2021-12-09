import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/article_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/newscubit.dart';
import 'package:news_app/shared/cubit/newsstates.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        var list = cubit.search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color:(cubit.isDark==null||cubit.isDark)? Colors.white:Colors.black ,
              onPressed: ()
              {
                Navigator.pop(context);
              },
            ),
            title: Text('Search News'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    cubit.getsearch(value);
                  },
                  style: TextStyle(color: Colors.grey[600]),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Need Some Words Here ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[600],
                    ),
                    labelText: 'Search',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600])),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              Expanded(
                  child: articleListView(list)
              ),

            ],
          ),
        );
      },
    );
  }
}
