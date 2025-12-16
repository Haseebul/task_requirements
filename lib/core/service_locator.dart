import 'package:get_it/get_it.dart';
import 'package:task_requirements/core/service/api_service.dart';
import 'package:task_requirements/core/service/product_service.dart';
import 'package:task_requirements/path_file.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/state/news/product_state.dart';
import 'package:task_requirements/state/product_details/product_details_state.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton<Store<AppState>>(
    Store<AppState>(
      initialState: AppState(
        (b) => b
          ..navbarState.replace(NavbarState.initial())
          ..productState.replace(ProductState.initial())
          ..productDetailsState.replace(ProductDetailsState.initial()),
      ),
    ),
  );
  sl.registerLazySingleton<ApiService>(() => ApiService());
}
