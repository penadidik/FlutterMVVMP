import 'package:flutter/material.dart';

import 'ArticleViewModel.dart';

class ArticleAdapter extends StatelessWidget {

  final List<ArticleViewModel> articles;

  ArticleAdapter({this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.articles.length,
      itemBuilder: (context, index) {

        final article = this.articles[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(article.newsImage)
                ),
                borderRadius: BorderRadius.circular(6)
            ),
            width: 50,
            height: 100,
          ),
          title: Text(article.newsTitle),
        );
      },
    );
  }
}