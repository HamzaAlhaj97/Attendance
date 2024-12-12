class Attendance {
  final String dayNumber;
  final String dayShort;
  final String arrivalTime;
  final String leavingTime;

  Attendance({
    required this.dayNumber,
    required this.dayShort,
    required this.arrivalTime,
    required this.leavingTime,
  });
}

List<Attendance> dummyAttendance = [
  Attendance(
    dayNumber: "06",
    dayShort: "Tue",
    arrivalTime: "09:08 AM",
    leavingTime: "06:05 PM",
  ),
  Attendance(
    dayNumber: "07",
    dayShort: "Wed",
    arrivalTime: "09:15 AM",
    leavingTime: "05:45 PM",
  ),
  Attendance(
    dayNumber: "08",
    dayShort: "Thu",
    arrivalTime: "09:08 AM",
    leavingTime: "05:45 PM",
  ),
  Attendance(
    dayNumber: "09",
    dayShort: "Fri",
    arrivalTime: "10:15 AM",
    leavingTime: "04:45 PM",
  ),
];