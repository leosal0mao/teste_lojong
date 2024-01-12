import 'package:teste_lojong/features/app/domain/entities/list_quotes_entity.dart';

class ListQuoteModel extends ListQuotesEntity {
  ListQuoteModel({
    required super.hasMore,
    required super.currentPage,
    required super.lastPage,
    required super.nextPage,
    required super.list,
  });

  factory ListQuoteModel.fromJson(Map<String, dynamic> json) => ListQuoteModel(
        hasMore: json["has_more"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        nextPage: json["next_page"],
        list: List<ListQuoteElement>.from(
            json["list"].map((x) => ListQuoteElementModel.fromJson(x))),
      );
}

class ListQuoteElementModel extends ListQuoteElement {
  ListQuoteElementModel({
    required super.id,
    required super.text,
    required super.author,
    required super.order,
  });

  factory ListQuoteElementModel.fromJson(Map<String, dynamic> json) =>
      ListQuoteElementModel(
        id: json["id"],
        text: json["text"],
        author: json["author"],
        order: json["order"],
      );
}
