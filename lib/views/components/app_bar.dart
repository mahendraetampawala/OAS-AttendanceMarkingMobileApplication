import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/page_tiles.dart';

class ApplicationBar {
  static AppBar getDefaultAppBar({
    @required BuildContext? context,
    String title = AppUtils.APP_NAME_LONG,
  }) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
    );
  }

  static AppBar getAuthenticatedAppBar({
    @required BuildContext? context,
    String title = AppUtils.APP_NAME_LONG,
    String? pageHeader,
  }) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            AppUtils.defaultUser = null;
            AppNavigator.navigateToSignInPage(context: context);
          },
          icon: Icon(
            Icons.logout,
          ),
        ),
      ],
      bottom: pageHeader == null
          ? null
          : PreferredSize(
              child: PageTiles.getTitleHeaderTile(
                context: context,
                title: pageHeader,
              ),
              preferredSize: Size(MediaQuery.of(context!).size.width, 65),
            ),
    );
  }

  static Widget getBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppUtils.bottomNavigationBarCurrentIndex,
      // type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      backgroundColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.home,
          ),
          label: "Attendance",
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.save,
          ),
          label: "Leaves",
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.account_circle_rounded,
          ),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        AppUtils.bottomNavigationBarCurrentIndex = index;
        if (index == 0) {
          //Navigate to Attendance
          AppNavigator.navigateToAttendancePage(context: context);
        } else if (index == 1) {
          //Navigate to Leaves
          AppNavigator.navigateToLeavesPage(context: context);
        } else if (index == 2) {
          //Navigate to Profile
          AppNavigator.navigateToProfilePage(context: context);
        }
      },
    );
  }
}
