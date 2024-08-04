//Name: Nadun Daluwatta
//Email: nadundaluwatta0426@gmail.com

import 'dart:io';

void main() {
  var monthlyIncome = 0.0;
  var expenses = <String, double>{};
  var totalSpent = 0.0;

  // get monthly income

  print('Enter your monthly income:');
  monthlyIncome = double.parse(stdin.readLineSync()!);

  // control expenses

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
      print('Warning: exceeded your monthly income $category.');
    }
  }

  // budget reportt

  print('\n----- Monthly budget summary ------');
  print('Monthly Income: Rs.${monthlyIncome.toStringAsFixed(2)}');

  print('Expenses:');
  expenses.forEach((category, amount) {
    print('  $category: Rs.${amount.toStringAsFixed(2)}');
  });
  print('Total Amount Spent: Rs.${totalSpent.toStringAsFixed(2)}');
}
