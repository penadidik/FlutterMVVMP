import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ArticleAdapter.dart';
import 'ArticlePresenter.dart';

class ArticleView extends StatefulWidget {
  String pageTitle = "";

  ArticleView({this.pageTitle});

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleView> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<ArticlePresenter>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(widget.pageTitle)
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.fetchArticle(context, value);
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),

                ),
              ),
              Expanded(
                  child: ArticleAdapter(articles: vm.articles))
            ])
        )

    );
  }
}