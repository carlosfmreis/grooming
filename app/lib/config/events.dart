import 'package:calendar_view/calendar_view.dart';

class Events {
  static final controller = EventController();

  static void get() {
    controller.add(
      CalendarEventData(
        title: 'Cão XPTO',
        date: DateTime.now(),
        endDate: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 2)),
      ),
    );
  }
}
