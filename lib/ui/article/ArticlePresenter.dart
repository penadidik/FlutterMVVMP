import 'package:base_mvvmp/network/RemoteData.dart';
import 'package:flutter/material.dart';

import 'ArticleModel.dart';
import 'ArticleViewModel.dart';


class ArticlePresenter extends ChangeNotifier {

  List<ArticleViewModel> articles = List<ArticleViewModel>();
  List<ArticleModel> article = new List<ArticleModel>();

  Future<void> fetchArticle(BuildContext context, String keyword) async {
    var response = await RemoteData().getArticles(context, keyword, "1", "7", "", "","");
    List<dynamic> result = new List<dynamic>();
    response.forEach((key, value) {
      if(key == 'articles'){
        result.addAll(value);
      }
    });
    this.article = result.map((e) => ArticleModel.fromJson(e)).toList();
    this.articles = article.map((e) => ArticleViewModel(article: e)).toList();
    print(this.articles);
    notifyListeners();
  }

}

