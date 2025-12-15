// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navbar_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavbarState extends NavbarState {
  @override
  final int currentIndex;
  @override
  final BuiltMap<Object, OperationState> operationsState;

  factory _$NavbarState([void Function(NavbarStateBuilder)? updates]) =>
      (NavbarStateBuilder()..update(updates))._build();

  _$NavbarState._({required this.currentIndex, required this.operationsState})
    : super._();
  @override
  NavbarState rebuild(void Function(NavbarStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavbarStateBuilder toBuilder() => NavbarStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavbarState &&
        currentIndex == other.currentIndex &&
        operationsState == other.operationsState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentIndex.hashCode);
    _$hash = $jc(_$hash, operationsState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NavbarState')
          ..add('currentIndex', currentIndex)
          ..add('operationsState', operationsState))
        .toString();
  }
}

class NavbarStateBuilder implements Builder<NavbarState, NavbarStateBuilder> {
  _$NavbarState? _$v;

  int? _currentIndex;
  int? get currentIndex => _$this._currentIndex;
  set currentIndex(int? currentIndex) => _$this._currentIndex = currentIndex;

  MapBuilder<Object, OperationState>? _operationsState;
  MapBuilder<Object, OperationState> get operationsState =>
      _$this._operationsState ??= MapBuilder<Object, OperationState>();
  set operationsState(MapBuilder<Object, OperationState>? operationsState) =>
      _$this._operationsState = operationsState;

  NavbarStateBuilder();

  NavbarStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentIndex = $v.currentIndex;
      _operationsState = $v.operationsState.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavbarState other) {
    _$v = other as _$NavbarState;
  }

  @override
  void update(void Function(NavbarStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavbarState build() => _build();

  _$NavbarState _build() {
    _$NavbarState _$result;
    try {
      _$result =
          _$v ??
          _$NavbarState._(
            currentIndex: BuiltValueNullFieldError.checkNotNull(
              currentIndex,
              r'NavbarState',
              'currentIndex',
            ),
            operationsState: operationsState.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'operationsState';
        operationsState.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'NavbarState',
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
