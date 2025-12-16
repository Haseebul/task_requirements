// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductState extends ProductState {
  @override
  final BuiltList<Product> articles;
  @override
  final int currentPage;
  @override
  final bool hasMore;
  @override
  final BuiltMap<Object, OperationState> operationsState;

  factory _$ProductState([void Function(ProductStateBuilder)? updates]) =>
      (ProductStateBuilder()..update(updates))._build();

  _$ProductState._({
    required this.articles,
    required this.currentPage,
    required this.hasMore,
    required this.operationsState,
  }) : super._();
  @override
  ProductState rebuild(void Function(ProductStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductStateBuilder toBuilder() => ProductStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductState &&
        articles == other.articles &&
        currentPage == other.currentPage &&
        hasMore == other.hasMore &&
        operationsState == other.operationsState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, currentPage.hashCode);
    _$hash = $jc(_$hash, hasMore.hashCode);
    _$hash = $jc(_$hash, operationsState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductState')
          ..add('articles', articles)
          ..add('currentPage', currentPage)
          ..add('hasMore', hasMore)
          ..add('operationsState', operationsState))
        .toString();
  }
}

class ProductStateBuilder
    implements Builder<ProductState, ProductStateBuilder> {
  _$ProductState? _$v;

  ListBuilder<Product>? _articles;
  ListBuilder<Product> get articles =>
      _$this._articles ??= ListBuilder<Product>();
  set articles(ListBuilder<Product>? articles) => _$this._articles = articles;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  bool? _hasMore;
  bool? get hasMore => _$this._hasMore;
  set hasMore(bool? hasMore) => _$this._hasMore = hasMore;

  MapBuilder<Object, OperationState>? _operationsState;
  MapBuilder<Object, OperationState> get operationsState =>
      _$this._operationsState ??= MapBuilder<Object, OperationState>();
  set operationsState(MapBuilder<Object, OperationState>? operationsState) =>
      _$this._operationsState = operationsState;

  ProductStateBuilder();

  ProductStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articles = $v.articles.toBuilder();
      _currentPage = $v.currentPage;
      _hasMore = $v.hasMore;
      _operationsState = $v.operationsState.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductState other) {
    _$v = other as _$ProductState;
  }

  @override
  void update(void Function(ProductStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductState build() => _build();

  _$ProductState _build() {
    _$ProductState _$result;
    try {
      _$result =
          _$v ??
          _$ProductState._(
            articles: articles.build(),
            currentPage: BuiltValueNullFieldError.checkNotNull(
              currentPage,
              r'ProductState',
              'currentPage',
            ),
            hasMore: BuiltValueNullFieldError.checkNotNull(
              hasMore,
              r'ProductState',
              'hasMore',
            ),
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
          r'ProductState',
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
