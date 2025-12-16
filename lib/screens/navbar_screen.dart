import 'package:flutter/material.dart';
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/action/update_navbar_action.dart';
import 'package:task_requirements/core/service/product_service.dart';
import 'package:task_requirements/core/service_locator.dart';
import 'package:task_requirements/screens/product_details_screen.dart';
import 'package:task_requirements/screens/products_screen.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/path_file.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavbarViewModel>(
      converter: (store) => NavbarViewModel.fromStore(store),
      builder: (context, vm) {
        return Scaffold(
          body: [
            ProductsScreen(navbarViewModel: vm),
            Center(child: Text("More")),
          ][vm.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: vm.currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Product Screen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'More',
              ),
            ],

            onTap: (index) {
              vm.dispatch(UpdateNavbarAction(newIndex: index));
            },
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}

class NavbarViewModel {
  final int currentIndex;
  final Function(ReduxAction<AppState>)
  dispatch; // Dispatching actions for AppState

  NavbarViewModel({required this.currentIndex, required this.dispatch});

  factory NavbarViewModel.fromStore(Store<AppState> store) {
    return NavbarViewModel(
      currentIndex: store.state.navbarState.currentIndex,
      dispatch: (ReduxAction<AppState> action) {
        store.dispatch(action); // Dispatch the action to the global store
      },
    );
  }
}
