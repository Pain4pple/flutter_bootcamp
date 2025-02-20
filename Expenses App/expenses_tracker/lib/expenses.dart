import 'package:expenses_tracker/widgets/chart/chart.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      date: DateTime.now(),
      category: Category.Food,
      amount: 19.99,
    ),
    Expense(
      title: 'Cinema',
      date: DateTime.now(),
      category: Category.Leisure,
      amount: 19.99,
    ),
  ];

  void _openModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: _openModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: width < 600 
        ? Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses,
                onRemoveExpense: _removeExpense,
              ),
            ),
          ],
        ) : 
        Row(
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses),),
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses,
                onRemoveExpense: _removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
