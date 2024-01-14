import 'package:teste_lojong/features/app/data/models/list_quote_model.dart';

abstract class GetQuotesDatasource {
  Future<ListQuoteModel> getQuotes();
}
