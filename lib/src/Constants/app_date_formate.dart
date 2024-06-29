import 'package:intl/intl.dart';

var date = DateTime.now();
var outputFormat = DateFormat('yyyy-MM-dd');
var createOrderFormat = DateFormat('dd/MM/yyyy, hh:mm');//18-04-2022 7:30 PM
var orderFormat = DateFormat('dd.MM.yyyy');
var upcomingFormat = DateFormat('dd MMM yyyy');
var timeFormat = DateFormat('hh:mm a');
var cartOrderFormat = DateFormat('yyyy-MM-ddTHH:mm:ss+0000');
var dateMonthFormat = DateFormat("dd/MM/yyyy");

class DateUtilforpass {
  static const dateFormat = 'dd/MM/yyyy';

  String formattedDate(DateTime dateTime) {
    return DateFormat(dateFormat).format(dateTime);
  }
}