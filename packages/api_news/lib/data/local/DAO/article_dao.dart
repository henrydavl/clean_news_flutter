import 'package:core_entity/news/response/article_response.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {

  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}