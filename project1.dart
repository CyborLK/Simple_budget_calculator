//Project 1.1
//Name: Nadun Daluwatta
//Email: nadundaluwatta0426@gmail.com

import 'dart:io';
double totalSpent = 0;



double getMonthlyIncome() {
  print('Enter your monthly income:');
  return double.parse(stdin.readLineSync()!);
}

Map<String, double> getExpenses(double monthlyIncome) {
  var expenses = <String, double>{};
  //double totalSpent = 0;

  print('Enter your expenses (type "done" to finish):');
  while (true) {
    print('Enter expense category:');
    var category = stdin.readLineSync()!;
    if (category.toLowerCase() == 'done') break;

    print('Enter amount spent for $category:');
    var amountSpent = double.parse(stdin.readLineSync()!);

    expenses[category] = amountSpent;
    totalSpent += amountSpent;

    if (totalSpent > monthlyIncome) {
      print('Warning: exceeded your monthly income in $category.');
    }
  }
  return expenses;
}

void printBudgetReport(double monthlyIncome, Map<String, double> expenses) {

  print('\n----- Monthly Budget Summary ------');
  print('Monthly Income: Rs.${monthlyIncome.toStringAsFixed(2)}');

  print('Expenses:');
  expenses.forEach((category, amount) {
    print('  $category: Rs.${amount.toStringAsFixed(2)}');
  });

  print('Total Amount Spent: Rs.${totalSpent.toStringAsFixed(2)}');
}

void main() {
  var monthlyIncome = getMonthlyIncome();
  var expenses = getExpenses(monthlyIncome);
  printBudgetReport(monthlyIncome, expenses);
}
