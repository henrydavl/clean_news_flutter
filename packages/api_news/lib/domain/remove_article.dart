import 'package:core/usecaes/usecase.dart';
import 'package:core_entity/news/local/article.dart';

import '../data/repository/contract/article_repository.dart';


class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}