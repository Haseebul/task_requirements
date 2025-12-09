import 'package:task_requirements/core/service/notification/fcm_service.dart';
import 'package:task_requirements/core/service/notification/local_notification_handler.dart';

class NotificationService {
  static final _localNotificationHandler = LocalNotificationHandler();
  static final fcmService = FCMService(_localNotificationHandler);

  static Future<void> initialize() async {
    await fcmService.initialize();
    await _localNotificationHandler.initialize();
  }
}
