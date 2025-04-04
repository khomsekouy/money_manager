import 'package:flutter/material.dart';

class MonthlyWidgets extends StatefulWidget {
  const MonthlyWidgets({super.key});

  @override
  State<MonthlyWidgets> createState() => _MonthlyWidgetsState();
}

class _MonthlyWidgetsState extends State<MonthlyWidgets> {
  String selectedWeek = '';

  final List<Map<String, dynamic>> transactionData = [
    {
      "month": "Apr",
      "dateRange": "01/04 ~ 30/04",
      "weeks": [
        {"range": "27/04 ~ 03/05", "income": "0.00៛", "expense": "0.00៛"},
        {"range": "20/04 ~ 26/04", "income": "0.00៛", "expense": "0.00៛"},
        {"range": "13/04 ~ 19/04", "income": "0.00៛", "expense": "0.00៛"},
        {"range": "06/04 ~ 12/04", "income": "0.00៛", "expense": "0.00៛"},
        {"range": "30/03 ~ 05/04", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Mar",
      "dateRange": "01/03 ~ 31/03",
      "weeks": [
        {
          "range": "01/03 ~ 31/03",
          "income": "100,000.00៛",
          "expense": "40,000.00៛",
        },
      ],
    },
    {
      "month": "Feb",
      "dateRange": "01/02 ~ 28/02",
      "weeks": [
        {"range": "01/02 ~ 28/02", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Jan",
      "dateRange": "01/01 ~ 31/01",
      "weeks": [
        {"range": "01/01 ~ 31/01", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Dec",
      "dateRange": "01/12 ~ 31/12",
      "weeks": [
        {"range": "01/12 ~ 31/12", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Nov",
      "dateRange": "01/11 ~ 30/11",
      "weeks": [
        {"range": "01/11 ~ 30/11", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Oct",
      "dateRange": "01/10 ~ 31/10",
      "weeks": [
        {"range": "01/10 ~ 31/10", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
    {
      "month": "Sep",
      "dateRange": "01/09 ~ 30/09",
      "weeks": [
        {"range": "01/09 ~ 30/09", "income": "0.00៛", "expense": "0.00៛"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (context, index) {
          final monthData = transactionData[index];
          return Card(
            semanticContainer: false,
            elevation: 0,
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthData["month"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    monthData["dateRange"],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              children:
                  monthData["weeks"].map<Widget>((week) {
                    bool isSelected = selectedWeek == week["range"];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedWeek = isSelected ? "" : week["range"];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.redAccent.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              week["range"],
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).textTheme.bodyMedium!.color,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  week["income"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  week["expense"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          );
        },
      );
  }
}
