class ArticleModel {
  String id;
  String newsTitle;
  String description;
  String newsImage;
  String reference;
  String newsCategoriesId;
  String newsCategoryTitle;
  String idWriter;
  String nameWriter;
  String userPicture;
  String createdAt;
  String updatedAt;

  ArticleModel(
      {this.id,
        this.newsTitle,
        this.description,
        this.newsImage,
        this.reference,
        this.newsCategoriesId,
        this.newsCategoryTitle,
        this.idWriter,
        this.nameWriter,
        this.userPicture,
        this.createdAt,
        this.updatedAt});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsTitle = json['news_title'];
    description = json['description'];
    newsImage = json['news_image'];
    reference = json['reference'];
    newsCategoriesId = json['news_categories_id'];
    newsCategoryTitle = json['news_category_title'];
    idWriter = json['id_writer'];
    nameWriter = json['name_writer'];
    userPicture = json['user_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['news_title'] = this.newsTitle;
    data['description'] = this.description;
    data['news_image'] = this.newsImage;
    data['reference'] = this.reference;
    data['news_categories_id'] = this.newsCategoriesId;
    data['news_category_title'] = this.newsCategoryTitle;
    data['id_writer'] = this.idWriter;
    data['name_writer'] = this.nameWriter;
    data['user_picture'] = this.userPicture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}