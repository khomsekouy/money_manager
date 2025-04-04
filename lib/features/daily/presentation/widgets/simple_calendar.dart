import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleCalendar extends StatelessWidget {
  final DateTime now = DateTime.now();

  SimpleCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    int firstWeekday = DateTime(now.year, now.month, 1).weekday;

    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: Column(
        children: [
          Text(
            DateFormat.yMMMM().format(now), // Show "April 2025"
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 7 days in a week
              childAspectRatio: 1.5,
            ),
            itemCount: firstWeekday + daysInMonth,
            itemBuilder: (context, index) {
              if (index < firstWeekday) {
                return const SizedBox(); // Empty space before 1st day
              }
              int dayNumber = index - firstWeekday + 1;
              return Center(
                child: Text(
                  "$dayNumber",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}