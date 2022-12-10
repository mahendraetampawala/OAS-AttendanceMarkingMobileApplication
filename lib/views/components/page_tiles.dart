import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTiles {
  static Widget getHeaderTile({
    @required BuildContext? context,
    String title = "",
    double height = 200,
    double imageWidth = 75,
    double imageHeight = 75,
    double imageScale = 1.5,
    double titleFontSize = 24,
  }) {
    return Container(
      width: MediaQuery.of(context!).size.width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/img/system/icon.png",
            scale: imageScale,
            width: imageWidth,
            height: imageHeight,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
            ),
          ),
        ],
      ),
    );
  }

  static Widget getTitleHeaderTile({
    @required BuildContext? context,
    String title = "",
    double height = 55,
    double titleFontSize = 24,
  }) {
    return Container(
      width: MediaQuery.of(context!).size.width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(12),
        //   bottomRight: Radius.circular(12),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            // color: Theme.of(context).primaryColor.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  static Widget getLoadingTile(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            // color: Theme.of(context).primaryColor.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  static Widget homePageNavButtonTile({
    @required BuildContext? context,
    @required String? title,
    @required GestureTapCallback? onTap,
    double height = 150,
    double width = 0,
  }) {
    if (width == 0) {
      width = MediaQuery.of(context!).size.width / 2 - 30;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context!).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 10,
        ),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              // color: Theme.of(context).primaryColor.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }

  static Widget subNavButtonTile({
    @required BuildContext? context,
    @required String? title,
    @required GestureTapCallback? onTap,
    double height = 150,
    double width = 0,
  }) {
    if (width == 0) {
      width = MediaQuery.of(context!).size.width / 2 - 30;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context!).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 10,
        ),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
