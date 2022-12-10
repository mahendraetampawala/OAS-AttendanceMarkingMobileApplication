import 'package:flutter/material.dart';
import 'package:oas_app/api_manager/attendance_api_manager.dart';
import 'package:oas_app/models/attendance.dart';
import 'package:oas_app/models/responses/attendances_list_response.dart';
import 'package:oas_app/services/geo_location_service.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/page_tiles.dart';
import 'package:point_in_polygon/point_in_polygon.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  List<Attendance> _attendances = [];
  @override
  void initState() {
    _getAttendanceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getAuthenticatedAppBar(
        context: context,
        pageHeader: "Attendance",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AppUtils.isCommiunicatingWithApi
            ? PageTiles.getLoadingTile(
                context,
              )
            : ListView.builder(
                itemCount: _attendances.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return _buildAttendanceTile(context, _attendances[index]);
                },
              ),
      ),
      bottomNavigationBar: ApplicationBar.getBottomNavBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          AppNavigator.navigateToMarkAttendancePage(context: context);
          GeoLocationService.determinePosition().then((value) {
            print("lat = ${value.latitude} | long  = ${value.longitude}");
            bool status = GeoLocationService.checkLoation(
                Point(y: value.latitude, x: value.longitude));
            print("Status = $status");
          });
        },
      ),
    );
  }

  Widget _buildAttendanceTile(BuildContext context, Attendance attendance) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
        top: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.calendar_view_month_rounded,
            ),
            title: Text(
                "Date:- In:${attendance.dateIn!}\t\t\tOut: ${attendance.dateOut ?? '---'}"),
            subtitle: Text(
                "Time:- In:${attendance.inTime!}\t\t\tOut: ${attendance.outTime ?? '---'}"),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
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

  void _getAttendanceList() async {
    setState(() {
      AppUtils.isCommiunicatingWithApi = true;
    });
    await Future.delayed(Duration(
      milliseconds: 2000,
    )).then((value) {
      AttendanceApiManager.defaultApiManager
          .getAttendancess()
          .then((AttendancesListResponse? response) {
        setState(() {
          this._attendances = response!.attendances!;
          AppUtils.isCommiunicatingWithApi = false;
        });
      });
    });
  }

  // List<Attendance> _generateDummyAttendences() {
  //   List<Attendance> l = [];
  //   for (var i = 1; i < 28; i++) {
  //     l.add(
  //       Attendance.all(
  //         id: i,
  //         dateIn: "2022-03-$i",
  //         dateOut: "2022-03-$i",
  //         inTime: "08:00",
  //         outTime: "17:00",
  //       ),
  //     );
  //   }
  //   return l;
  // }
}
