import 'package:api_news/data/api/news_api_service.dart';
import 'package:api_news/data/local/app_database.dart';
import 'package:api_news/data/repository/article_repository_impl.dart';
import 'package:api_news/data/repository/contract/article_repository.dart';
import 'package:api_news/domain/get_article.dart';
import 'package:api_news/domain/get_saved_article.dart';
import 'package:api_news/domain/remove_article.dart';
import 'package:api_news/domain/save_article.dart';

import 'package:clean_news/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:clean_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.asNewInstance(); // sl = service locator

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  /// Retrofit
  sl.registerSingleton<NewsApiService>(
      NewsApiService(sl())
  );

  /// Repository
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl(), sl())
  );

  /// UserCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );
  sl.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(sl())
  );
  sl.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(sl())
  );
  sl.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(sl())
  );

  /// Blocs
  sl.registerFactory<RemoteArticleBloc>(
          () => RemoteArticleBloc(sl())
  );
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl())
  );
}
