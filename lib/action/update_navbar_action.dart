import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';

class UpdateNavbarAction extends Action<NavbarState> {
  final int newIndex;

  UpdateNavbarAction({required this.newIndex});

  @override
  // The 'reduce' function returns a new, rebuilt instance of NavbarState
  NavbarState reduce() {
    // We use the BuiltValue's rebuild method to create the new immutable state
    return state.rebuild((b) => b.currentIndex = newIndex);
  }
}
