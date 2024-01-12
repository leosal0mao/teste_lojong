class ArticlesListEntity {
  bool hasMore;
  int currentPage;
  int lastPage;
  int nextPage;
  List<ListElementEntity> list;

  ArticlesListEntity({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.list,
  });
}

class ListElementEntity {
  int id;
  String text;
  String title;
  String imageUrl;
  String authorName;
  String url;
  int premium;
  int order;
  String image;

  ListElementEntity({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.premium,
    required this.order,
    required this.image,
  });
}
