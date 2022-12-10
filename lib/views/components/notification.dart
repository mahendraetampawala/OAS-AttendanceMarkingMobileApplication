import 'package:flutter/material.dart';
import 'package:oas_app/views/components/button_tiles.dart';

class AppNotification {
  static void showSnack({
    @required BuildContext? context,
    @required String? message,
    @required IconData? iconData,
    int? duraionSec = 5,
  }) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duraionSec!),
        content: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(message!),
                  Icon(iconData),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showModel({
    @required BuildContext? context,
    @required String? title,
    @required IconData? icon,
    double? iconSize = 24.0,
    @required Color? iconColor,
    @required VoidCallback? onButtonPressed,
    @required String? buttonText,
    Color? titleColor = Colors.green,
    bool? barrierDismissible = true,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible!,
      context: context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: iconColor,
              )
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTiles.getNotificationButtonTile(
                context: context,
                title: buttonText,
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void showErrorNotificationAlert(
      {@required BuildContext? context, @required String? text}) {
    AppNotification.showModel(
      context: context,
      title: text,
      icon: Icons.error_outline,
      iconColor: Colors.red[300],
      titleColor: Theme.of(context!).primaryColor,
      onButtonPressed: () {
        Navigator.of(context).pop();
      },
      iconSize: 100,
      buttonText: "OK",
      barrierDismissible: false,
    );
  }

  static void showSuccessNotificationAlert(
      {@required BuildContext? context, String message = "Successful..!"}) {
    AppNotification.showModel(
      barrierDismissible: false,
      context: context!,
      title: message,
      icon: Icons.check_circle,
      iconSize: 100,
      iconColor: Colors.green,
      onButtonPressed: () {
        Navigator.of(context).pop();
      },
      buttonText: "OK",
    );
  }
}
