class Attendance {
  int? id;
  String? dateIn;
  String? dateOut;
  String? inTime;
  String? outTime;

  Attendance();

  Attendance.all({
    required this.id,
    required this.dateIn,
    required this.dateOut,
    required this.inTime,
    required this.outTime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => new Attendance.all(
        id: json['id'],
        dateIn: json['dateIn'],
        dateOut: json['dateOut'],
        inTime: json['timeIn'],
        outTime: json['timeOut'],
      );
}
