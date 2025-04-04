import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_money_manager/features/daily/presentation/widgets/app_bar_widgets.dart';
import 'package:iconly/iconly.dart';

import '../widgets/daily_widgets.dart';
import '../widgets/monthly_widgets.dart';
import '../widgets/table_calendar_widgets.dart';
import '../widgets/weekly_widgets.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  DateTime selectedDate = DateTime.now(); // Current date

  String formatDate(DateTime date) {
    return DateFormat("dd-MMM-yyyy").format(date);
  }

  void pickDate() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2025, 1, 1),
      maxTime: DateTime(2050, 12, 31),
      onChanged: (date) {
        setState(() {
          selectedDate = date;
        });
      },
      currentTime: selectedDate,
      locale: LocaleType.en,
    );
  }

  void previousDay() {
    setState(() {
      selectedDate = selectedDate.subtract(Duration(days: 1));
    });
  }

  void nextDate() {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: AppBarWidgets(
        title: 'Trans.',
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(IconlyLight.bookmark), onPressed: () {}),
          IconButton(icon: Icon(IconlyLight.filter), onPressed: () {}),
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: previousDay,
                    icon: Icon(IconlyLight.arrow_left_2),
                  ),
                  GestureDetector(
                    onTap: pickDate,
                    child: Text(
                      formatDate(selectedDate),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: nextDate,
                    icon: Icon(IconlyLight.arrow_right_2),
                  ),
                ],
              ),
              TabBar(
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                indicatorColor: Theme.of(context).colorScheme.primary,
                isScrollable: true,
                tabs: [
                  Tab(height: 50, text: 'Daily'),
                  Tab(height: 50, text: 'Weekly'),
                  Tab(height: 50, text: 'Monthly'),
                  Tab(height: 50, text: 'Calender'),
                  Tab(height: 50, text: 'Summary'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoColumn('Income', '0.00', Colors.blue),
                    _buildInfoColumn('Exp.', '0.00', Colors.red),
                    _buildInfoColumn('Total', '0.00', Colors.purpleAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: DailyWidgets()),
            Center(child: WeeklyWidgets()),
            Center(child: MonthlyWidgets()),
            Center(child: CurrentMonthCalendar()),
            Center(child: Text('Summary')),
          ],
        ),
      ),
    );
  }
  Widget _buildInfoColumn(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
