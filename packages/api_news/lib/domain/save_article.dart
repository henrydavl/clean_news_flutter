import 'package:api_news/data/repository/contract/article_repository.dart';
import 'package:core/usecaes/usecase.dart';
import 'package:core_entity/news/local/article.dart';


class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}