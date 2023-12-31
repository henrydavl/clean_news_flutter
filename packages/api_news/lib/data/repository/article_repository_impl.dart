import 'dart:io';

import 'package:api_news/data/api/news_api_service.dart';
import 'package:api_news/data/local/app_database.dart';
import 'package:api_news/data/repository/contract/article_repository.dart';
import 'package:core/constants/constants.dart';
import 'package:core/resources/data_state.dart';
import 'package:core_entity/news/local/article.dart';
import 'package:core_entity/news/response/article_response.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final response = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data.articles!);
      } else {
        return DataFailed(
            DioException(
                error: response.response.statusMessage,
                response: response.response,
                type: DioExceptionType.badResponse,
                requestOptions: response.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }
}