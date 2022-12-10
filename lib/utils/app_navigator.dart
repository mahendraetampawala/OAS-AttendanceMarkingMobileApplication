import 'package:flutter/material.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/utils/routs.dart';

class AppNavigator extends Navigator {
  static navigateToSignInPage({
    @required BuildContext? context,
  }) {
    // Navigator.of(context!).pushNamed(
    //   Routes.ROUTES_SIGNIN,
    // );
    Navigator.of(context!).pushNamedAndRemoveUntil(
        Routes.ROUTES_SIGNIN, (Route<dynamic> route) => false);
  }

  static navigateToAttendancePage({
    @required BuildContext? context,
  }) {
    AppUtils.bottomNavigationBarCurrentIndex = 0;
    Navigator.of(context!).pushNamedAndRemoveUntil(
        Routes.ROUTES_ATTENDANCE, (Route<dynamic> route) => false);
  }

  static navigateToProfilePage({
    @required BuildContext? context,
  }) {
    AppUtils.bottomNavigationBarCurrentIndex = 2;
    Navigator.of(context!).pushNamedAndRemoveUntil(
        Routes.ROUTES_PROFILE, (Route<dynamic> route) => false);
  }

  static navigateToChangePasswordPage({
    @required BuildContext? context,
  }) {
    Navigator.of(context!).pushNamed(
      Routes.ROUTES_CHANGE_PASSWORD,
    );
  }

  static navigateToMarkAttendancePage({
    @required BuildContext? context,
  }) {
    Navigator.of(context!).pushNamed(
      Routes.ROUTES_MARK_ATTENDANCE,
    );
  }

  static navigateToLeavesPage({
    @required BuildContext? context,
  }) {
    AppUtils.bottomNavigationBarCurrentIndex = 1;
    Navigator.of(context!).pushNamedAndRemoveUntil(
        Routes.ROUTES_LEAVES, (Route<dynamic> route) => false);
  }

  static navigateToLeaveRequestFormPage({
    @required BuildContext? context,
  }) {
    Navigator.of(context!).pushNamed(
      Routes.ROUTES_LEAVE_REQUEST_FORM,
    );
  }
}
