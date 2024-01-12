class ListQuotesEntity {
  bool hasMore;
  int currentPage;
  int lastPage;
  int nextPage;
  List<ListQuoteElement> list;

  ListQuotesEntity({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.list,
  });
}

class ListQuoteElement {
  int id;
  String text;
  String author;
  int order;

  ListQuoteElement({
    required this.id,
    required this.text,
    required this.author,
    required this.order,
  });
}
