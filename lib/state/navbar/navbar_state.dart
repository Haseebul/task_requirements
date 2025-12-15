import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dash_kit_core/dash_kit_core.dart';

part 'navbar_state.g.dart';

abstract class NavbarState implements Built<NavbarState, NavbarStateBuilder>, GlobalState {
  factory NavbarState([void Function(NavbarStateBuilder) updates]) = _$NavbarState;

  NavbarState._();

  factory NavbarState.initial() {
    return NavbarState(
      (b) => b
        ..currentIndex = 0
        ..operationsState = BuiltMap<Object, OperationState>().toBuilder(), // REQUIRED
    );
  }

  // --- APPLICATION DATA FIELD ---
  int get currentIndex;

  // --- GLOBAL STATE REQUIREMENTS (IMPLEMENTATION) ---

  @override
  BuiltMap<Object, OperationState> get operationsState; // REQUIRED GETTER

  // REQUIRED METHOD (Implementation uses BuiltValue's rebuild)
  @override
  T updateOperation<T extends GlobalState>(Object? operationKey, OperationState operationState) {
    if (operationKey == null) {
      return this as T;
    }

    final GlobalState newState = rebuild((s) => s.operationsState[operationKey] = operationState);
    return newState as T;
  }

  // REQUIRED METHOD
  @override
  OperationState getOperationState(Object operationKey) {
    return operationsState[operationKey] ?? OperationState.idle;
  }
}
