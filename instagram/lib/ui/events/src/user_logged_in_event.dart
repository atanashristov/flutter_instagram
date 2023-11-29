import 'package:instagram/ui/events/src/event_base.dart';

class UserLoggedInEvent extends EventBase {
  UserLoggedInEvent({required this.userId});

  final String userId;
}
