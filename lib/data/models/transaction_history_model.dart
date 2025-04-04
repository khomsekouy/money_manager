class TransactionMonth {
  final String month;
  final String dateRange;
  final List<TransactionWeek> weeks;

  TransactionMonth({
    required this.month,
    required this.dateRange,
    required this.weeks,
  });

  factory TransactionMonth.fromJson(Map<String, dynamic> json) {
    var weeksFromJson = json['weeks'] as List;
    List<TransactionWeek> weeksList =
        weeksFromJson.map((i) => TransactionWeek.fromJson(i)).toList();

    return TransactionMonth(
      month: json['month'] as String,
      dateRange: json['dateRange'] as String,
      weeks: weeksList,
    );
  }
}

class TransactionWeek {
  final String range;
  final String income;
  final String expense;

  TransactionWeek({
    required this.range,
    required this.income,
    required this.expense,
  });

  factory TransactionWeek.fromJson(Map<String, dynamic> json) {
    return TransactionWeek(
      range: json['range'] as String,
      income: json['income'] as String,
      expense: json['expense'] as String,
    );
  }
}
