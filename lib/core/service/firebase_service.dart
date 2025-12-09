import 'package:firebase_core/firebase_core.dart';
import 'package:task_requirements/firebase_options.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (_) {}
  }
}
