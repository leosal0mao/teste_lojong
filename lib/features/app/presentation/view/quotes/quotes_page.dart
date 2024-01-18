import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_lojong/features/app/presentation/view/quotes/widgets/quote_card.dart';
import 'package:teste_lojong/features/app/presentation/viewmodel/get_quotes/bloc/get_quotes_bloc.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_error.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_loading.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_page_body.dart';

import '../../../../../core/injection/injection_container.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  var quotesBloc = getIt.get<GetQuotesBloc>();

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      child: BlocProvider(
        create: (context) {
          quotesBloc.add(GetQuotesListEvent(page: 1));
          return quotesBloc;
        },
        child: BlocBuilder<GetQuotesBloc, GetQuotesState>(
          builder: (context, state) {
            if (state is GetQuotesLoading) {
              return const CustomLoading();
            }
            if (state is GetQuotesFailure) {
              return const CustomErrorWidget();
            }
            if (state is GetQuotesSuccess) {
              return ListView.builder(
                itemCount: state.quotes.list.length,
                itemBuilder: (context, i) {
                  var quote = state.quotes.list[i];
                  return QuoteCard(
                    quote: quote.text,
                    quoteAuthor: quote.author,
                  );
                },
              );
            }
            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
