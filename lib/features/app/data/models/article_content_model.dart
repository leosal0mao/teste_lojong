import 'package:teste_lojong/features/app/domain/entities/article_content_entity.dart';

class ArticleContentModel extends ArticleContentEntity {
  ArticleContentModel({
    required super.id,
    required super.text,
    required super.title,
    required super.imageUrl,
    required super.authorName,
    required super.url,
    required super.premium,
    required super.order,
    required super.fullText,
    required super.authorImage,
    required super.authorDescription,
    required super.image,
  });

  factory ArticleContentModel.fromJson(Map<String, dynamic> json) =>
      ArticleContentModel(
        id: json["id"],
        text: json["text"],
        title: json["title"],
        imageUrl: json["image_url"],
        authorName: json["author_name"],
        url: json["url"],
        premium: json["premium"],
        order: json["order"],
        fullText: json["full_text"],
        authorImage: json["author_image"],
        authorDescription: json["author_description"],
        image: json["image"],
      );
}
