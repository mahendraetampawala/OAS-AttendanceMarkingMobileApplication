class LeaveRequest {
  int? formType;
  int? formId;
  int? requestedEmployeeId;
  String? subject;
  String? reason;
  String? dateFrom;
  String? dateTo;
  String? timeFrom;
  String? timeTo;

  LeaveRequest();

  LeaveRequest.all({
    required this.formType,
    required this.formId,
    required this.requestedEmployeeId,
    required this.subject,
    required this.reason,
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
  });

  Map<String, String> toJson() => {
        "email": this.formType.toString(),
        "password": this.formId.toString(),
        "requestedEmployeeId": this.requestedEmployeeId.toString(),
        "subject": this.subject.toString(),
        "reason": this.reason.toString(),
        "dateFrom": this.dateFrom.toString(),
        "dateTo": this.dateTo.toString(),
        "timeFrom": "00:00:00",
        "timeTo": "00:00:00"
      };
}
