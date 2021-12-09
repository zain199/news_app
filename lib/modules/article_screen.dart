import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/newscubit.dart';
import 'package:news_app/shared/cubit/newsstates.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {

  String weburl;
  ArticleScreen(String url)
  {
    weburl = url;
  }
  @override
  Widget build(BuildContext context) {
        return  Scaffold(
          appBar: AppBar(
            title: Text('News'),
          ),
          body: Center(
            child: WebView(
              initialUrl: weburl,
            ),
          ),
    );
  }
}
