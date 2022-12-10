import 'package:flutter/material.dart';
import 'package:oas_app/utils/app_utils.dart';

class Leave {
  int? id;
  int? requestedUserId;
  String? requestedUserName;
  String? subject;
  String? reason;
  String? dateFrom;
  String? dateTo;
  ApprovedStatus? status;
  String? statusReason;

  Leave();

  Leave.all({
    required this.id,
    required this.requestedUserId,
    required this.requestedUserName,
    required this.subject,
    required this.reason,
    required this.dateFrom,
    required this.dateTo,
    required this.status,
    required this.statusReason,
  });
  factory Leave.fromJson(Map<String, dynamic> json) => new Leave.all(
        id: json['id'],
        requestedUserId: json['requestedEmployeeId'],
        requestedUserName: AppUtils.defaultUser!.shortName,
        subject: json['subject'],
        reason: json['reason'],
        dateFrom: json['dateFrom'],
        dateTo: json['dateTo'],
        status: json['leaveStatus'] == 0
            ? ApprovedStatus.PENDING
            : (json['leaveStatus'] == 1
                ? ApprovedStatus.APPROVED
                : (json['leaveStatus'] == 2
                    ? ApprovedStatus.REJECTED
                    : ApprovedStatus.FINISHED)),
        statusReason: json['adminNote'],
      );
  Color getstatusColor(BuildContext context) {
    if (status == ApprovedStatus.PENDING) {
      return Theme.of(context).primaryColor.withOpacity(0.6);
    }
    if (status == ApprovedStatus.APPROVED) {
      return Colors.green.withOpacity(0.6);
    }
    if (status == ApprovedStatus.REJECTED) {
      return Colors.red.withOpacity(0.6);
    } else {
      return Colors.grey.withOpacity(0.6);
    }
  }

  ApprovedStatus getApprovedStatus(int status) {
    if (status == 0) {
      return ApprovedStatus.PENDING;
    } else if (status == 1) {
      return ApprovedStatus.APPROVED;
    } else if (status == 2) {
      return ApprovedStatus.REJECTED;
    } else {
      return ApprovedStatus.FINISHED;
    }
  }

  bool canVisibleTheStatus(BuildContext context) {
    if (status == ApprovedStatus.PENDING) {
      return false;
    } else if (status == ApprovedStatus.APPROVED) {
      return true;
    } else if (status == ApprovedStatus.REJECTED) {
      return true;
    } else {
      return false;
    }
  }
}

enum ApprovedStatus {
  PENDING,
  APPROVED,
  REJECTED,
  FINISHED,
}
