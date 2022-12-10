import 'package:flutter/material.dart';
import 'package:oas_app/api_manager/leave_api_manager.dart';
import 'package:oas_app/models/leave.dart';
import 'package:oas_app/models/responses/leaves_list_response.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/page_tiles.dart';

class LeavesView extends StatefulWidget {
  const LeavesView({Key? key}) : super(key: key);

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  List<Leave> _leaves = [];
  @override
  void initState() {
    _getLeavesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getAuthenticatedAppBar(
        context: context,
        pageHeader: "Leaves",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AppUtils.isCommiunicatingWithApi
            ? PageTiles.getLoadingTile(
                context,
              )
            : ListView.builder(
                itemCount: _leaves.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return _buildLeaveTile(context, _leaves[index]);
                },
              ),
      ),
      bottomNavigationBar: ApplicationBar.getBottomNavBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () =>
            AppNavigator.navigateToLeaveRequestFormPage(context: context),
      ),
    );
  }

  Widget _buildLeaveTile(BuildContext context, Leave leave) {
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
              Icons.work_off_outlined,
            ),
            title: Text("${leave.subject!}"),
            subtitle: Text(
                "${leave.reason!}\nFrom ${leave.dateFrom!}\t\t\t\tTo: ${leave.dateTo!}"),
            isThreeLine: true,
            dense: false,
            onTap: () => _buildLeaveDetailsView(context, leave),
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
            // color: Colors.grey.withOpacity(0.6),
            color: leave.getstatusColor(context),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  _buildLeaveDetailsView(BuildContext context, Leave leave) {
    showDialog(
      barrierDismissible: true,
      context: context,
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
                "Leave Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Container(
          // height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLeaveDetailsRow(
                subject: "Subect",
                value: "${leave.subject}",
              ),
              _buildLeaveDetailsRow(
                subject: "Reason",
                value: "${leave.reason}",
              ),
              _buildLeaveDetailsRow(
                subject: "From",
                value: "${leave.dateFrom}",
              ),
              _buildLeaveDetailsRow(
                subject: "To",
                value: "${leave.dateTo}",
              ),
              _buildLeaveDetailsRow(
                subject: "Status",
                value: "${leave.status.toString().split('.')[1]}",
                valueFontColor: leave.getstatusColor(context),
                valueFontWeight: FontWeight.bold,
              ),
              leave.canVisibleTheStatus(context)
                  ? _buildLeaveDetailsRow(
                      subject: "Reason",
                      value: "${leave.statusReason}",
                    )
                  : Container()
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTiles.getNotificationButtonTile(
                context: context,
                title: "OK",
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveDetailsRow({
    required String subject,
    required String value,
    FontWeight valueFontWeight = FontWeight.normal,
    Color valueFontColor = Colors.black,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      height: 50,
      child: Row(
        children: [
          Text(
            "$subject : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Text(
              "$value",
              style: TextStyle(
                fontWeight: valueFontWeight,
                color: valueFontColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getLeavesList() async {
    setState(() {
      AppUtils.isCommiunicatingWithApi = true;
    });
    await LeaveApiManager.defaultApiManager
        .getLeaves()
        .then((LeavesListResponse? listResponse) {
      setState(() {
        this._leaves = listResponse!.leaves!;
        AppUtils.isCommiunicatingWithApi = false;
      });
    });
  }

  // List<Leave> _generateDummyAttendences() {
  //   List<Leave> l = [];
  //   for (var i = 1; i <= 12; i++) {
  //     l.add(Leave.all(
  //       id: i,
  //       requestedUserId: i,
  //       requestedUserName: AppUtils.defaultUser!.shortName!,
  //       subject: "Subject $i",
  //       reason: "I want a leave because of my personal issue.",
  //       dateFrom: "2021-$i-$i",
  //       dateTo: "2021-$i-${i + 1}",
  //       status: _getStatus(i),
  //       statusReason: _getStatusReason(i),
  //     ));
  //   }
  //   return l;
  // }

  // ApprovedStatus _getStatus(int i) {
  //   if (i == 1) {
  //     return ApprovedStatus.PENDING;
  //   } else if (i > 6) {
  //     return ApprovedStatus.FINISHED;
  //   } else if ((i % 2) == 1) {
  //     return ApprovedStatus.APPROVED;
  //   } else {
  //     return ApprovedStatus.CANCELED;
  //   }
  // }

  // String _getStatusReason(int i) {
  //   if (i == 1) {
  //     // return ApprovedStatus.PENDING;
  //     return "-";
  //   } else if (i > 6) {
  //     // return ApprovedStatus.FINISHED;
  //     return "-";
  //   } else if ((i % 2) == 1) {
  //     // return ApprovedStatus.APPROVED;
  //     return "Good to go.";
  //   } else {
  //     // return ApprovedStatus.CANCELED;
  //     return "Cannot Approve the Leave Request";
  //   }
  // }
}
