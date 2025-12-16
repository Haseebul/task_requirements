import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/state/news/product_state.dart';
import 'package:task_requirements/state/product_details/product_details_state.dart';
part 'app_state.g.dart';

abstract class AppState
    implements Built<AppState, AppStateBuilder>, GlobalState {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
  AppState._();
  NavbarState get navbarState;
  ProductState get productState;
  ProductDetailsState get productDetailsState;
  @override
  T updateOperation<T extends GlobalState>(
    Object? operationKey,
    OperationState operationState,
  ) {
    if (operationKey == null) {
      return this as T;
    }

    final GlobalState newState = rebuild(
      (s) => s.operationsState[operationKey] = operationState,
    );
    return newState as T;
  }

  @override
  OperationState getOperationState(Object operationKey) {
    return operationsState[operationKey] ?? OperationState.idle;
  }
}
