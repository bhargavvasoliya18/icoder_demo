import 'package:bhargav_practicle/src/Model/TransactionModel/transaction_model.dart';
import 'package:bhargav_practicle/src/Page/AddEarningScreen/add_earning_screen.dart';
import 'package:bhargav_practicle/src/Page/AddExpenseScreen/add_expense_screen.dart';
import 'package:bhargav_practicle/src/Utils/Helper/DatabaseHelper/database_helper.dart';
import 'package:bhargav_practicle/src/Utils/Helper/getx_navigation.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {

  final dbHelper = DatabaseHelper();
  var transactions = <TransactionModel>[].obs;
  var balance = 0.0.obs;

  var isEditExpense = false.obs;
  var isEditEarning = false.obs;
  TransactionModel selectTransaction = TransactionModel();

  navigateEditExpenseScreen(TransactionModel transaction){
      selectTransaction = transaction;
    if(transaction.transactionType == 0){
      isEditExpense.value = true;
      update();
      navigatePush(AddExpenseScreen());
    }else{
      isEditEarning.value = true;
      update();
      navigatePush(AddEarningScreen());
    }

  }

  Future<void> loadTransactions() async {
    transactions.value = await dbHelper.getTransactions();
    transactions.refresh();
    calculateBalance();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    await dbHelper.addTransaction(transaction);
    loadTransactions();
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await dbHelper.updateTransaction(transaction);
    loadTransactions();
  }

  Future<void> deleteTransaction(int id) async {
    await dbHelper.deleteTransaction(id);
    loadTransactions();
  }

  void calculateBalance() {
    balance.value = transactions.fold(0, (sum, item) => sum + (item.transactionAmount ?? 0).toDouble());
  }

  initState()async{
   isEditExpense.value = false;
   isEditEarning.value = false;
   await loadTransactions();
  }

  // Future<List<TransactionModel>> getFilteredTransactions(DateTime startDate, DateTime endDate) async {
  //   return transactions.where((transaction) {
  //     return transaction.dateTime.isAfter(startDate) && transaction.dateTime.isBefore(endDate);
  //   }).toList();
  // }
}