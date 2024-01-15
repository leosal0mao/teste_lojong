import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_lojong/core/network/errors/failure.dart';
import 'package:teste_lojong/features/app/data/models/articles_list_model.dart';
import 'package:teste_lojong/features/app/domain/interfaces/list_articles/list_articles_interface.dart';
import 'package:teste_lojong/features/app/domain/usecases/list_articles/get_articles_list_usecase.dart';

class MockListArticlesInterface extends Mock implements ListArticlesInterface {}

void main() {
  late GetArticleListUsecase usecase;
  late MockListArticlesInterface mockListArticlesInterface;

  setUp(() {
    mockListArticlesInterface = MockListArticlesInterface();
    usecase = GetArticleListUsecase(repository: mockListArticlesInterface);
  });

  group('GetArticleListUsecase', () {
    test('should return articles list when the repository returns success',
        () async {
      // Arrange
      final articlesListModel = ArticlesListModel(
          hasMore: false,
          currentPage: 1,
          lastPage: 5,
          nextPage: 2,
          list: [
            ListArticleElement(
                id: 1,
                text: '',
                title: '',
                imageUrl: '',
                authorName: 'author',
                url: 'url',
                premium: 1,
                order: 1,
                image: '')
          ]);
      when(mockListArticlesInterface.getArticles())
          .thenAnswer((_) async => Right(articlesListModel));

      // Act
      final result = await usecase(const ParamsGetArticlesListUsecase(page: 1));

      // Assert
      verify(mockListArticlesInterface.getArticles()).called(1);
      expect(result, Right(GetArticlesListResult(response: articlesListModel)));
    });

    test('should return a ServerFailure when the repository returns failure',
        () async {
      // Arrange
      when(mockListArticlesInterface.getArticles())
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await usecase(const ParamsGetArticlesListUsecase(page: 1));

      // Assert
      verify(mockListArticlesInterface.getArticles()).called(1);
      expect(result, Left(ServerFailure()));
    });
  });
}
