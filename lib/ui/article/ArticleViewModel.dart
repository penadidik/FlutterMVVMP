import 'ArticleModel.dart';

class ArticleViewModel {

  final ArticleModel article;

  ArticleViewModel({this.article});

  String get id{
    return this.id;
  }

  String get newsTitle {
    return this.article.newsTitle;
  }

  String get description {
    return this.article.description;
  }

  String get newsImage {
    return this.article.newsImage;
  }

  String get reference {
    return this.article.reference;
  }

  String get newsCategoriesId {
    return this.article.newsCategoriesId;
  }

  String get newsCategoryTitle {
    return this.article.newsCategoryTitle;
  }

  String get idWriter {
    return this.article.idWriter;
  }

  String get nameWriter {
    return this.article.nameWriter;
  }

  String get userPicture {
    return this.article.userPicture;
  }

  String get createdAt {
    return this.article.createdAt;
  }

  String get updatedAt {
    return this.article.updatedAt;
  }

}