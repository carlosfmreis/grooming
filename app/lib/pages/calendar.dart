import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

enum CalendarViewType { day, week, month }

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarViewType _currentView = CalendarViewType.day;

  late final List<Widget> _calendarViews;

  @override
  void initState() {
    super.initState();
    _calendarViews = [DayView(), WeekView(), MonthView()];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16.0),
        SegmentedButton<CalendarViewType>(
          selected: <CalendarViewType>{_currentView},
          onSelectionChanged: (Set<CalendarViewType> newSelection) {
            setState(() {
              _currentView = newSelection.first;
            });
          },
          segments: const [
            ButtonSegment<CalendarViewType>(
              value: CalendarViewType.day,
              label: Text('Dia'),
              icon: Icon(Icons.calendar_view_day),
            ),
            ButtonSegment<CalendarViewType>(
              value: CalendarViewType.week,
              label: Text('Semana'),
              icon: Icon(Icons.calendar_view_week),
            ),
            ButtonSegment<CalendarViewType>(
              value: CalendarViewType.month,
              label: Text('Mês'),
              icon: Icon(Icons.calendar_view_month),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: IndexedStack(
            index: _currentView.index,
            children: _calendarViews,
          ),
        ),
      ],
    );
  }
}
