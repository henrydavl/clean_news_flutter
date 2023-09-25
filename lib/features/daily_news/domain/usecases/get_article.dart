import 'package:core/resources/data_state.dart';
import 'package:core/usecaes/usecase.dart';
import 'package:clean_news/features/daily_news/domain/entities/article.dart';
import 'package:clean_news/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}