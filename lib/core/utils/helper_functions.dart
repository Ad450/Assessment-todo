import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/core/app/app_locator.dart';

import '../app/app_theme.dart';

void showToast(String message) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: locator.get<AppTheme>().genericBlackColor,
      textColor: locator.get<AppTheme>().genericWhiteColor,
      fontSize: 16.0);
}
