class ExpensesVsIncome {
  final String day;
  final int incomeValue;
  final int expenseValue;

  ExpensesVsIncome(
      {required this.day,
      required this.expenseValue,
      required this.incomeValue});

  static List<ExpensesVsIncome> getExpenseVsIncome() {
    final List<ExpensesVsIncome> chartdata = [
      ExpensesVsIncome(day: "M", incomeValue: 5000, expenseValue: 15000),
      ExpensesVsIncome(day: "T", incomeValue: 7000, expenseValue: 2500),
      ExpensesVsIncome(day: "W", incomeValue: 10000, expenseValue: 1000),
      ExpensesVsIncome(day: "Th", incomeValue: 2500, expenseValue: 1000),
      ExpensesVsIncome(day: "F", incomeValue: 15000, expenseValue: 2000),
      ExpensesVsIncome(day: "Sa", incomeValue: 1000, expenseValue: 900),
      ExpensesVsIncome(day: "S", incomeValue: 1000, expenseValue: 1000)
    ];

    return chartdata;
  }
}
