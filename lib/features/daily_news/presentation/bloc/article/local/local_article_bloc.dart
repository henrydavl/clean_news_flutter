import 'dart:async';

import 'package:api_news/domain/get_saved_article.dart';
import 'package:api_news/domain/remove_article.dart';
import 'package:api_news/domain/save_article.dart';
import 'package:bloc/bloc.dart';
import 'package:core_entity/news/local/article.dart';
import 'package:equatable/equatable.dart';

part 'local_article_event.dart';

part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on <GetSavedArticles> (onGetSavedArticles);
    on <RemoveArticle> (onRemoveArticle);
    on <SaveArticle> (onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticles event,Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticle,Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticle,Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
