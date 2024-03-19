import 'package:intl/intl.dart';

String formattedDate(DateTime now) {
  String date = DateFormat('dd/MM/yyyy').format(now);
  return date;
}
