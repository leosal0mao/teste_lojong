class ArticleContentEntity {
  int id;
  String text;
  String title;
  String imageUrl;
  String authorName;
  String url;
  int premium;
  int order;
  String fullText;
  String authorImage;
  dynamic authorDescription;
  String image;

  ArticleContentEntity({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.premium,
    required this.order,
    required this.fullText,
    required this.authorImage,
    required this.authorDescription,
    required this.image,
  });
}
