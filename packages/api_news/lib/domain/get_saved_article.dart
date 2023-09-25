import 'package:core/usecaes/usecase.dart';
import 'package:core_entity/news/local/article.dart';

import '../data/repository/contract/article_repository.dart';


class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}