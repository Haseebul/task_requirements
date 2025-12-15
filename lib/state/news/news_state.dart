import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:task_requirements/core/models/alticle.dart';

part 'news_state.g.dart';

enum Operation { loadArticles }

// The implementation uses BuiltValue syntax
abstract class NewsState implements Built<NewsState, NewsStateBuilder>, GlobalState {
  // BuiltValue boilerplate
  factory NewsState([void Function(NewsStateBuilder) updates]) = _$NewsState;

  NewsState._();

  // Initial State: Data fields should have default values
  factory NewsState.initial() {
    return NewsState(
      (b) => b
        ..articles.replace([]) // Initial empty list
        ..operationsState = BuiltMap<Object, OperationState>().toBuilder(),
    );
  }

  // --- APPLICATION DATA FIELDS ---
  BuiltList<Article> get articles; // Use BuiltList for immutable collections

  // --- GLOBAL STATE REQUIREMENTS ---
  @override
  BuiltMap<Object, OperationState> get operationsState;

  // Implementation required by GlobalState (uses BuiltValue's rebuild)
  @override
  T updateOperation<T extends GlobalState>(Object? operationKey, OperationState operationState) {
    if (operationKey == null) {
      return this as T;
    }

    final GlobalState newState = rebuild((s) => s.operationsState[operationKey] = operationState);
    return newState as T;
  }

  @override
  OperationState getOperationState(Object operationKey) {
    return operationsState[operationKey] ?? OperationState.idle;
  }
}
