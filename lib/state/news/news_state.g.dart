// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsState extends NewsState {
  @override
  final BuiltList<Article> articles;
  @override
  final BuiltMap<Object, OperationState> operationsState;

  factory _$NewsState([void Function(NewsStateBuilder)? updates]) =>
      (NewsStateBuilder()..update(updates))._build();

  _$NewsState._({required this.articles, required this.operationsState})
    : super._();
  @override
  NewsState rebuild(void Function(NewsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsStateBuilder toBuilder() => NewsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsState &&
        articles == other.articles &&
        operationsState == other.operationsState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, operationsState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsState')
          ..add('articles', articles)
          ..add('operationsState', operationsState))
        .toString();
  }
}

class NewsStateBuilder implements Builder<NewsState, NewsStateBuilder> {
  _$NewsState? _$v;

  ListBuilder<Article>? _articles;
  ListBuilder<Article> get articles =>
      _$this._articles ??= ListBuilder<Article>();
  set articles(ListBuilder<Article>? articles) => _$this._articles = articles;

  MapBuilder<Object, OperationState>? _operationsState;
  MapBuilder<Object, OperationState> get operationsState =>
      _$this._operationsState ??= MapBuilder<Object, OperationState>();
  set operationsState(MapBuilder<Object, OperationState>? operationsState) =>
      _$this._operationsState = operationsState;

  NewsStateBuilder();

  NewsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articles = $v.articles.toBuilder();
      _operationsState = $v.operationsState.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsState other) {
    _$v = other as _$NewsState;
  }

  @override
  void update(void Function(NewsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsState build() => _build();

  _$NewsState _build() {
    _$NewsState _$result;
    try {
      _$result =
          _$v ??
          _$NewsState._(
            articles: articles.build(),
            operationsState: operationsState.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
        _$failedField = 'operationsState';
        operationsState.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'NewsState',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
