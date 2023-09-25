import 'package:api_news/data/repository/contract/article_repository.dart';
import 'package:core/resources/data_state.dart';
import 'package:core/usecaes/usecase.dart';
import 'package:core_entity/news/local/article.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}