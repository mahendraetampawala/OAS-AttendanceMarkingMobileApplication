import 'package:flutter/material.dart';
import 'package:oas_app/services/geo_location_service.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/utils/routs.dart';
import 'package:oas_app/utils/theme_colours.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // if (AppInit.currentApp.isSomeOneAlreadyLoggedIn()) {
    //   AuthController.defaultController.getAndsetLoggedInUserDetails();
    // }
    return MaterialApp(
      title: AppUtils.APP_NAME_LONG,
      theme: ThemeData(
        // primarySwatch: ThemeColors.getPrimaryColor(),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: "Poppins",
      ),
      routes: Routes.routes,
      onUnknownRoute: Routes.onUnknownRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
