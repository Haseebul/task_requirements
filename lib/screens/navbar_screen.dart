import 'package:flutter/material.dart';

import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/action/update_navbar_action.dart';
import 'package:task_requirements/screens/news_screen.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';
import 'package:task_requirements/path_file.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  late Store<NavbarState> store;
  final List<Widget> _screens = const [
    // Tab 0
    NewsScreen(),
    // Tab 1
    Center(
      child: Text(
        'Settings Screen Content',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  void initState() {
    store = Store<NavbarState>(initialState: NavbarState.initial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1. Use StoreConnector, specialized for NavbarState
    return StoreProvider<NavbarState>(
      store: store,
      child: StoreConnector<NavbarState, _NavbarViewModel>(
        // 2. Convert NavbarState to a simple ViewModel
        converter: (store) => _NavbarViewModel.fromStore(store),

        builder: (context, vm) {
          return Scaffold(
            // Display the screen corresponding to the current index from the state
            body: _screens[vm.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              // Read the current index from the ViewModel/State
              currentIndex: vm.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News Screen'),
                BottomNavigationBarItem(icon: Icon(Icons.description), label: 'News Details'),
              ],

              // On tap, dispatch the action to update the state
              onTap: (index) {
                vm.dispatch(UpdateNavbarAction(newIndex: index));
              },
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

// ViewModel to hold the data and the dispatch function
class _NavbarViewModel {
  final int currentIndex;

  // The dispatch function is generic over the state type: NavbarState
  final Function(ReduxAction<NavbarState> action) dispatch;

  _NavbarViewModel({required this.currentIndex, required this.dispatch});

  factory _NavbarViewModel.fromStore(Store<NavbarState> store) {
    return _NavbarViewModel(currentIndex: store.state.currentIndex, dispatch: store.dispatch);
  }
}
