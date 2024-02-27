class MyExpenses {
  final String expenseName;
  final int expenceValue;
  MyExpenses({required this.expenseName, required this.expenceValue});

  static List<MyExpenses> getMyExpense() {
    final List<MyExpenses> chartData = [
      MyExpenses(expenseName: "Debt", expenceValue: 15),
      MyExpenses(expenseName: "Report", expenceValue: 15),
      MyExpenses(expenseName: "Debt", expenceValue: 15),
      MyExpenses(expenseName: "Credit", expenceValue: 15),
      MyExpenses(expenseName: "Visualize", expenceValue: 15),
      MyExpenses(expenseName: "Budget", expenceValue: 15),
      MyExpenses(expenseName: "Expenses", expenceValue: 15),
      MyExpenses(expenseName: "Income", expenceValue: 15),
    ];
    return chartData;
  }
}
