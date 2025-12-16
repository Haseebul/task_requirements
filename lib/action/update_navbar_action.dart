import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:task_requirements/state/app_state.dart';
import 'package:task_requirements/state/navbar/navbar_state.dart';

class UpdateNavbarAction extends Action<AppState> {
  final int newIndex;

  UpdateNavbarAction({required this.newIndex});

  @override
  AppState reduce() {
    return state.rebuild((b) => b.navbarState.currentIndex = newIndex);
  }
}
