import 'package:event_bus/event_bus.dart';

EventBus cartEventBus = EventBus();
class CartStore{
  String name;
  String action;
  CartStore(this.action, this.name);
}