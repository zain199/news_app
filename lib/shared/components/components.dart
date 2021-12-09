import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/article_screen.dart';

Widget articleBuilder (list , index,context)
{
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(list[index]['urlToImage'].toString()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${list[index]['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${list[index]['publishedAt']}",
                    style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget articleListView(list)
{
  return ConditionalBuilder(
    condition: list.length>0,
    builder: (context) => ListView.separated(

      itemBuilder: (context, index) =>  GestureDetector(child: articleBuilder(list,index,context),
        onTap: (){
          NavigatorTo(context, ArticleScreen(list[index]['url']));
        },),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Divider(
          thickness: 2.0,
          color: Colors.orange,
        ),
      ),
      itemCount: list.length,
    ),
    fallback: (context) => Center(
      child:CircularProgressIndicator()
    ),
  );
}

void NavigatorTo(context,widget)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));
}
