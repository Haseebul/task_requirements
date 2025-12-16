// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final NavbarState navbarState;
  @override
  final ProductState productState;
  @override
  final ProductDetailsState productDetailsState;
  @override
  final BuiltMap<Object, OperationState> operationsState;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (AppStateBuilder()..update(updates))._build();

  _$AppState._({
    required this.navbarState,
    required this.productState,
    required this.productDetailsState,
    required this.operationsState,
  }) : super._();
  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        navbarState == other.navbarState &&
        productState == other.productState &&
        productDetailsState == other.productDetailsState &&
        operationsState == other.operationsState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, navbarState.hashCode);
    _$hash = $jc(_$hash, productState.hashCode);
    _$hash = $jc(_$hash, productDetailsState.hashCode);
    _$hash = $jc(_$hash, operationsState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('navbarState', navbarState)
          ..add('productState', productState)
          ..add('productDetailsState', productDetailsState)
          ..add('operationsState', operationsState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  NavbarStateBuilder? _navbarState;
  NavbarStateBuilder get navbarState =>
      _$this._navbarState ??= NavbarStateBuilder();
  set navbarState(NavbarStateBuilder? navbarState) =>
      _$this._navbarState = navbarState;

  ProductStateBuilder? _productState;
  ProductStateBuilder get productState =>
      _$this._productState ??= ProductStateBuilder();
  set productState(ProductStateBuilder? productState) =>
      _$this._productState = productState;

  ProductDetailsStateBuilder? _productDetailsState;
  ProductDetailsStateBuilder get productDetailsState =>
      _$this._productDetailsState ??= ProductDetailsStateBuilder();
  set productDetailsState(ProductDetailsStateBuilder? productDetailsState) =>
      _$this._productDetailsState = productDetailsState;

  MapBuilder<Object, OperationState>? _operationsState;
  MapBuilder<Object, OperationState> get operationsState =>
      _$this._operationsState ??= MapBuilder<Object, OperationState>();
  set operationsState(MapBuilder<Object, OperationState>? operationsState) =>
      _$this._operationsState = operationsState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _navbarState = $v.navbarState.toBuilder();
      _productState = $v.productState.toBuilder();
      _productDetailsState = $v.productDetailsState.toBuilder();
      _operationsState = $v.operationsState.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result =
          _$v ??
          _$AppState._(
            navbarState: navbarState.build(),
            productState: productState.build(),
            productDetailsState: productDetailsState.build(),
            operationsState: operationsState.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'navbarState';
        navbarState.build();
        _$failedField = 'productState';
        productState.build();
        _$failedField = 'productDetailsState';
        productDetailsState.build();
        _$failedField = 'operationsState';
        operationsState.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AppState',
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
