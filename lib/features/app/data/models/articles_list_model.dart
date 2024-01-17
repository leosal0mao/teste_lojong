import 'package:teste_lojong/features/app/domain/entities/articles_list_entity.dart';

class ArticlesListModel extends ArticlesListEntity {
  ArticlesListModel({
    required super.hasMore,
    required super.currentPage,
    required super.lastPage,
    required super.nextPage,
    required super.list,
  });

  factory ArticlesListModel.fromJson(Map<dynamic, dynamic> json) =>
      ArticlesListModel(
        hasMore: json["has_more"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        nextPage: json["next_page"],
        list: List<ListElementEntity>.from(
            json["list"].map((x) => ListArticleElement.fromJson(x))),
      );
}

class ListArticleElement extends ListElementEntity {
  ListArticleElement({
    required super.id,
    required super.text,
    required super.title,
    required super.imageUrl,
    required super.authorName,
    required super.url,
    required super.premium,
    required super.order,
    required super.image,
  });

  factory ListArticleElement.fromJson(Map<String, dynamic> json) =>
      ListArticleElement(
        id: json["id"],
        text: json["text"],
        title: json["title"],
        imageUrl: json["image_url"],
        authorName: json["author_name"],
        url: json["url"],
        premium: json["premium"],
        order: json["order"],
        image: json["image"],
      );
}
