import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oas_app/api_manager/attendance_api_manager.dart';
import 'package:oas_app/models/requests/attendance_request.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/page_tiles.dart';

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({Key? key}) : super(key: key);

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getDefaultAppBar(
        context: context,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageTiles.getTitleHeaderTile(
                context: context,
                title: "Mark Attendance",
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 30,
                  right: 30,
                  top: MediaQuery.of(context).size.height / 2 - 250,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppUtils.isCommiunicatingWithApi
                            ? CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              )
                            : PageTiles.homePageNavButtonTile(
                                context: context,
                                title: "Checked In/Out",
                                width: MediaQuery.of(context).size.width - 100,
                                height: 75,
                                onTap: () async {
                                  setState(() {
                                    AppUtils.isCommiunicatingWithApi = true;
                                  });
                                  AttendanceApiManager.defaultApiManager
                                      .markAttendances()
                                      .then((value) {
                                    setState(() {
                                      AppUtils.isCommiunicatingWithApi = false;
                                    });
                                  });
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ApplicationBar.getBottomNavBar(context),
    );
  }
}
