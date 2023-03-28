import 'package:mobx/mobx.dart';

part 'notifications_controller.g.dart';

class NotificationsController = NotificationsControllerBase
    with _$NotificationsController;

abstract class NotificationsControllerBase with Store {}
