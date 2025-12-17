import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/action/delete_product_action.dart';
import 'package:task_requirements/action/load_products_action.dart';
import 'package:task_requirements/action/update_navbar_action.dart';
import 'package:task_requirements/core/service/api_service.dart';
import 'package:task_requirements/core/service/firebase_service.dart';
import 'package:task_requirements/core/service/notification/notification_service.dart';
import 'package:task_requirements/core/service/product_service.dart';
import 'package:task_requirements/core/service_locator.dart';
import 'package:task_requirements/main.dart';
import 'package:task_requirements/screens/add_product_screen.dart';
import 'package:task_requirements/screens/navbar_screen.dart';
import 'package:task_requirements/screens/product_details_screen.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/state/news/product_state.dart';
import 'package:task_requirements/widgets/news_card.dart';
import 'package:async_redux/async_redux.dart';
import '../core/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Store<AppState> store = sl<Store<AppState>>();
  final apiService = sl<ApiService>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    store.dispatch(LoadProductsAction(apiService));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await FirebaseService.initializeFirebase();
      await NotificationService.initialize();
    });
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge && _scrollController.position.pixels > 0) {
      if (store.state.productState.hasMore) {
        store.dispatch(
          LoadProductsAction(apiService, page: store.state.productState.currentPage + 1),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Products'),
        actions: [
          ElevatedButton(
            onPressed: () {
              productNavigatorKey.currentState!.push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/productDetails'),
                  builder: (_) => ProductDetailsScreen(),
                ),
              );
              // Navigator.pushNamed(context, "/addProduct");
            },
            child: Text("Add Product"),
          ),
        ],
      ),
      body: StoreConnector<AppState, _NewsScreenViewModel>(
        converter: (store) => _NewsScreenViewModel.fromStore(store),
        builder: (context, vm) {
          if (vm.isLoading && vm.articles.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = vm.articles;
          if (products.isEmpty) {
            return const Center(child: Text("No products found."));
          }
          return Scrollbar(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: products.length + (vm.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == products.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return InkWell(
                  onTap: () {
                    ProductService.instance.updateSelectedProductId(products[index].id);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsScreen();
                        },
                      ),
                    );
                  },
                  child: NewsCard(
                    product: products[index],
                    onDelete: () {
                      store.dispatch(
                        DeleteProductAction(apiService, productId: products[index].id),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _NewsScreenViewModel {
  final List<Product> articles;
  final bool isLoading;

  _NewsScreenViewModel({required this.articles, required this.isLoading});

  factory _NewsScreenViewModel.fromStore(Store<AppState> store) {
    final loadingState = store.state.getOperationState(ProductOperation.loadProducts);

    return _NewsScreenViewModel(
      articles: store.state.productState.articles.toList(),
      isLoading: loadingState.isInProgress,
    );
  }
}
