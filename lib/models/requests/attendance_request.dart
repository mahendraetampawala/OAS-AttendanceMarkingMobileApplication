class AttendanceRequest {
  int? formType;
  int? formId;
  int? requestedEmployeeId;
  String? date;
  String? time;

  AttendanceRequest();

  AttendanceRequest.all({
    required this.formType,
    required this.formId,
    required this.requestedEmployeeId,
    required this.date,
    required this.time,
  });

  Map<String, String> toJson() => {
        "email": this.formType.toString(),
        "password": this.formId.toString(),
        "requestedEmployeeId": this.requestedEmployeeId.toString(),
        "date": this.date.toString(),
        "time": this.time.toString(),
      };
}
