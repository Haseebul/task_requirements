import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:task_requirements/core/service/api_service.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/news/product_state.dart';

class LoadProductsAction extends Action<AppState> {
  final ApiService _apiService;
  final int page;
  final int limit;
  LoadProductsAction(this._apiService, {this.page = 1, this.limit = 10});

  @override
  ProductOperation get operationKey => ProductOperation.loadProducts;

  @override
  Future<AppState> reduce() async {
    final fetchedArticles = await _apiService.fetchProducts(
      page: page,
      limit: limit,
    );
    if (fetchedArticles == null || fetchedArticles.isEmpty) {
      return state.rebuild((b) => b..productState.hasMore = false);
    }

    return state.rebuild(
      (b) => b
        ..productState.articles.addAll(fetchedArticles)
        ..productState.currentPage = page,
      // ..productState
      // ..articles.addAll(fetchedArticles)
      // ..currentPage = page,
    );
  }
}

class CreateProductAction extends Action<AppState> {
  final ApiService _apiService;
  final String title;
  final int price;
  final String description;
  final int categoryId;
  final List<String> images;

  CreateProductAction(
    this._apiService, {
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  @override
  ProductOperation get operationKey => ProductOperation.createProduct;

  @override
  Future<AppState> reduce() async {
    final newProduct = await _apiService.createProduct(
      title: title,
      price: price,
      description: description,
      categoryId: categoryId,
      images: images,
    );

    if (newProduct != null) {
      return state.rebuild(
        (b) => b.productState.articles.insert(0, newProduct),
      );
    }
    return state;
  }
}
