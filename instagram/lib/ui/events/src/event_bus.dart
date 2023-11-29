import 'dart:async';

import 'package:event_bus/event_bus.dart' as bus;

class EventBus {
  factory EventBus() {
    return _instance;
  }

  EventBus._internal();

  final bus.EventBus _eventBus = bus.EventBus();

  static final EventBus _instance = EventBus._internal();

  StreamSubscription<T> listen<T>(void Function(T) func) => _eventBus.on<T>().listen(func);

  void fire<T>(T event) => _eventBus.fire(event);
}
