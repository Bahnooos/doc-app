import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/helpers/shared_pref_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  checkIfisLoggedInUser();

  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

Future<void> checkIfisLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecureData(key: Constants.userToken);
  if (!userToken.isNullAndEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
