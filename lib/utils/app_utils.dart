import 'package:oas_app/models/user.dart';

class AppUtils {
  static const String APP_NAME_LONG = "Office Automation System";
  static const String APP_NAME_SHORT = "OAS";

  static bool isCommiunicatingWithApi = false;
  static User? defaultUser;
  static int bottomNavigationBarCurrentIndex = 0;
  static bool fromProfilePage = false;
}
