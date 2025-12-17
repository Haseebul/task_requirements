import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/core/service_locator.dart';
import 'package:task_requirements/path_file.dart';
import 'package:task_requirements/screens/add_product_screen.dart';
import 'package:task_requirements/screens/navbar_screen.dart';
import 'package:task_requirements/screens/product_details_screen.dart';
import 'package:task_requirements/screens/products_screen.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/state/news/product_state.dart';
import 'package:task_requirements/state/product_details/product_details_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    StoreProvider<AppState>(store: sl<Store<AppState>>(), child: const MyApp()),
  );
}

final GlobalKey<NavigatorState> productNavigatorKey =
GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NavbarScreen(),
      // initialRoute: '/',

      // routes: {
      //   // '/': (context) => NavbarScreen(),
      //   '/productsScreen': (context) => ProductsScreen(),
      //   '/productDetails': (context) => ProductDetailsScreen(),
      //   '/addProduct': (context) => AddProductScreen(),
      // },
    );
  }
}
