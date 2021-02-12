import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ArticlePresenter.dart';
import 'ArticleView.dart';

class Article extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Article",
        home:
        ChangeNotifierProvider(
          create: (context) => ArticlePresenter(),
          child: ArticleView(pageTitle: "Article Page"),
        )
    );
  }

}