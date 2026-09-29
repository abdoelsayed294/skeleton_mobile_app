import 'package:skeleton/features/expeness/ui/widgets/expense_speriod_selector.dart';

class ExpensesDateState {
  const ExpensesDateState({
    required this.selectedPeriod,
    required this.selectedDate,
  });
  final ExpensesPeriod selectedPeriod;
  final DateTime selectedDate;
}
