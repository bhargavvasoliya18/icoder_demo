import 'package:bhargav_practicle/src/Constants/app_date_formate.dart';
import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Model/TransactionModel/transaction_model.dart';
import 'package:bhargav_practicle/src/Page/AddEarningScreen/add_earning_screen.dart';
import 'package:bhargav_practicle/src/Page/AddExpenseScreen/add_expense_screen.dart';
import 'package:bhargav_practicle/src/Utils/Helper/DatabaseHelper/database_helper.dart';
import 'package:bhargav_practicle/src/Utils/Helper/getx_navigation.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {

  final dbHelper = DatabaseHelper();
  var transactions = <TransactionModel>[].obs;
  var filterTransactionsList = <TransactionModel>[].obs;
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

  selectStartEndDate(selectDate, focusDate, {bool? isSelectStartDate}){
    String formattedDate = DateUtilforpass().formattedDate(selectDate);
    (isSelectStartDate ?? false ? transactionStartDateController : transactionEndDateController).text = formattedDate;
    Get.back();
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

  clearFilter(){
    transactionEndDateController.text = "";
    transactionStartDateController.text = "";
    filterTransactionsList.clear();
    filterTransactionsList.refresh();
    Get.back();
  }

  initState()async{
   isEditExpense.value = false;
   isEditEarning.value = false;
   clearFilter();
   await loadTransactions();
  }

  applyFilter()async{
   filterTransactionsList.value = await getFilteredTransactions(transactionStartDateController.text, transactionEndDateController.text);
   filterTransactionsList.refresh();
   Get.back();
  }

  Future<List<TransactionModel>> getFilteredTransactions(String startDate, String endDate) async {
    DateTime formattedStartDate = dateMonthFormat.parse(startDate);
    DateTime formattedEndDate = dateMonthFormat.parse(endDate);
    return transactions.where((transaction) {
    DateTime dateTime = dateMonthFormat.parse(transaction.transactionDate ?? "");
      return dateTime.isAfter(formattedStartDate) && dateTime.isBefore(formattedEndDate);
    }).toList();
  }
}