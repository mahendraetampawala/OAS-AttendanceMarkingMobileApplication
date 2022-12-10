import 'package:flutter/material.dart';

class ButtonTiles {
  static Widget getButtonTile({
    @required BuildContext? context,
    @required String? title,
    @required VoidCallback? onPressed,
    double width = 150,
    double height = 40,
    TextStyle? style,
  }) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title!,
          style: style ?? TextStyle(),
        ),
      ),
    );
  }

  static Widget getLoadingButtonTile({
    @required BuildContext? context,
  }) {
    return Container(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
              width: 15,
              height: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text("Please Wait..."),
          ],
        ),
      ),
    );
  }

  static Widget getNotificationButtonTile({
    @required BuildContext? context,
    @required String? title,
    @required VoidCallback? onPressed,
  }) {
    return Container(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title!),
      ),
    );
  }
}
