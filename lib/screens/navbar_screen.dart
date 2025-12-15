import 'package:flutter/material.dart';

import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:task_requirements/action/update_navbar_action.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  final List<Widget> _screens = const [
    // Tab 0
    Center(
      child: Text(
        'Home Screen Content',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    // Tab 1
    Center(
      child: Text(
        'Settings Screen Content',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Use StoreConnector, specialized for NavbarState
    return StoreConnector<NavbarState, _NavbarViewModel>(
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
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
