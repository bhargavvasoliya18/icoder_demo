import 'package:bhargav_practicle/src/Element/textfield_controller.dart';
import 'package:bhargav_practicle/src/Model/UserModel/user_model.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/login_controller.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{

  logoutUser()async{
    final loginController = Get.put(LoginController());
    final transactionController = Get.put(TransactionController());
    loginController.signOut();
    loginController.userModel = UserModel();
    transactionController.filterTransactionsList.clear();
    transactionController.transactions.clear();
    clearTable("transactions");
    getStore.write("isLogin", false);
    Get.back();
  }

  Future<void> clearTable(String tableName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'transaction.db');

    final Database db = await openDatabase(path);

    await db.delete(tableName);

    // await db.close();
  }

  initState(){
    final loginController = Get.put(LoginController());
    profileNameController.text = "${loginController.userModel.firstName} ${loginController.userModel.lastName}";
    profileEmailController.text = loginController.userModel.email ?? "";
  }
}