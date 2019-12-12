import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();
class LoginStore{
  bool isLogin;
  String loginName;
  LoginStore(this.isLogin, this.loginName);
}