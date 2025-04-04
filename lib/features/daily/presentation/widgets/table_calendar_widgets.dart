import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CurrentMonthCalendar extends StatefulWidget {
  const CurrentMonthCalendar({super.key});

  @override
  _CurrentMonthCalendarState createState() => _CurrentMonthCalendarState();
}

class _CurrentMonthCalendarState extends State<CurrentMonthCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TableCalendar(
          firstDay: DateTime(_focusedDay.year, _focusedDay.month, 1),
          lastDay: DateTime(_focusedDay.year, _focusedDay.month + 1, 0),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month, // Show only one month
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          headerStyle: const HeaderStyle(
            formatButtonVisible: false, // Hide format button
            titleCentered: true,
          ),
        ),
      ),
    );
  }
}